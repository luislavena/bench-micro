class HelloWorld
  def call(env)
    Rack::Response.new('Hello World!', 200, { 'Content-Type' => 'text/html' }).finish
  end
end
