require "rack"

class HelloWorld
  def call(env)
    if env['REQUEST_METHOD'] == 'GET' && env['PATH_INFO'] == '/'
      Rack::Response.new("Hello World!", 200, { 'Content-Type' => 'text/html' }).finish
    else
      Rack::Response.new('', 404, { 'Content-Type' => 'text/html' }).finish
    end
  end
end

APP = HelloWorld.new
run APP
