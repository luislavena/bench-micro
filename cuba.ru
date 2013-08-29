require "cuba"

HelloWorld = Cuba.new do
  on default do
    res.write "Hello World!"
  end
end

run HelloWorld
