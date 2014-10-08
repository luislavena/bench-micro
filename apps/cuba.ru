require "cuba"

HelloWorld = Cuba.new do
  on get, root do
    res.write "Hello World!"
  end
end

APP = HelloWorld
run APP
