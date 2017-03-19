class HelloWorld
  def call(env)
    if env['REQUEST_METHOD'] == 'GET' && env['PATH_INFO'] == '/'
      [
        200,
        {'Content-Type' => 'text/html'},
        ["Hello World!"]
      ]
    else
      [
        404,
        {'Content-Type' => 'text/html'},
        [""]
      ]
    end
  end
end

APP = HelloWorld.new
run APP
