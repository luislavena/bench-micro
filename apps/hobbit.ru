require "hobbit"

class HelloWorld < Hobbit::Base
  get "/" do
    "Hello World!"
  end
end

APP = HelloWorld.new
run APP
