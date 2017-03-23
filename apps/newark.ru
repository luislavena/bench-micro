require "newark"

class HelloWorld
  include Newark

  get "/" do
    "Hello World!"
  end
end

APP = HelloWorld.new
run APP
