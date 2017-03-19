require "rackstep"

class HelloController < RackStep::Controller
  def process_request
    response.body = ["Hello World!"]
  end
end

class HelloWorld < RackStep::App
  add_route('GET', '', HelloController)
end

APP = HelloWorld

run APP
