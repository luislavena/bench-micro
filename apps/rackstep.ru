require "rackstep"

class HelloWorldController < RackStep::Controller
  def process_request
    response.body = ["Hello World!"]
  end
end

class HelloWorld < RackStep::App
  add_route('GET', '', HelloWorldController)
end

APP = HelloWorld

run APP
