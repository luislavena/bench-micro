require "nancy"

class HelloWorld < Nancy::Base
  get "/" do
    "Hello World!"
  end
end

APP = HelloWorld.new
run APP
