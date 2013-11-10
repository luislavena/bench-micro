require "scorched"

class HelloWorld < Scorched::Controller
  get "/" do
    "Hello World!"
  end
end

run HelloWorld
