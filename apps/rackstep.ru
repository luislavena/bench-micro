require 'rackstep'

class HelloWorld < RackStep::App
  add_route('GET', '', 'HelloWorldController')
end

class HelloWorldController < RackStep::Controller
  def process_request
    response.body = 'Hello World!'
  end
end

APP = HelloWorld

run APP
