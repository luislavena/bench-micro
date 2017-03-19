require 'rack/app'

class HelloWorld < Rack::App
  desc 'Hello World'
  get '/' do
    "Hello World!"
  end
end

APP = HelloWorld
run APP
