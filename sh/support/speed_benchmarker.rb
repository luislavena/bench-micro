class Benchmarker
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
    p1 = fork {
      silence_stream(STDOUT) do
        execute start_command
      end
    }
    Process.detach(p1)
    if start_command =~ /rails/
      sleep 1.5
    else
      sleep 0.8
    end
    p1
  end

  def stop_puma(server_pid)
    Process.kill("TERM", server_pid)
  end

  def start_wrk
    execute wrk_command
  end


  def start_command
    "puma -e production -t 16:16 #{config}"
  end

  def wrk_command
    "wrk -t 2  -d 2 http://localhost:9292/"
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

  # Silences any stream for the duration of the block.
  def silence_stream(stream)
    old_stream = stream.dup
    stream.reopen('/dev/null')
    stream.sync = true
    yield
  ensure
    stream.reopen(old_stream)
  end
end
