class SpeedBenchmarker
  attr_reader :config

  def initialize(config)
    @config = config
  end

  def run
    announce
    server_pid = start_puma
    start_wrk
    stop_puma(server_pid)
  end

  def announce
    puts banner(frameworkname)
  end

  def banner(str)
    "*" * 30 + " #{str.center(18)} " + "*" * 30
  end

  def frameworkname
    File.basename(config).gsub(".ru", '').upcase
  end

  def start_puma
    pid = Process.spawn(start_command, err: :out, out: IO::NULL)

    # wait for process to load
    sleep 3

    pid
  end

  def stop_puma(server_pid)
    Process.kill("TERM", server_pid)

    # wait before stop
    Process.wait(server_pid)
  end

  def start_wrk
    execute(wrk_command)
  end

  def start_command
    "puma --environment production --threads 16:16 #{config}"
  end

  def wrk_command
    "wrk --threads 2 --duration 10 http://localhost:9292/"
  end

  require 'pty'
  def execute(cmd)
    puts cmd
    begin
      PTY.spawn( cmd ) do |stdin, stdout, pid|
        begin
          stdin.each { |line| print line }
        rescue Errno::EIO
        end
      end
    rescue PTY::ChildExited
      puts "The child process exited!"
    end
  end
end
