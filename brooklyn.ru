require "brooklyn"

class HelloWorld < Brookyn::App
  get "/" do
    "Hello World!"
  end
end

run HelloWorld.new
