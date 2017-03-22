require 'watts'

class HelloWorldApp < Watts::App
  class HelloWorld < Watts::Resource
    get { 'Hello, World!' }
  end
  resource('/', HelloWorld)
end

APP = HelloWorldApp.new
run APP
