require "watts"

class HelloWorld < Watts::App
  class HelloController < Watts::Resource
    get { "Hello, World!" }
  end
  resource("/", HelloController)
end

APP = HelloWorld.new
run APP
