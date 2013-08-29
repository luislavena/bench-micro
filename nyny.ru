require "nyny"

class HelloWorld < NYNY::App
  get "/" do
    "Hello World!"
  end
end

run HelloWorld.new
