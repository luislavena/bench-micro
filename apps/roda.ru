require "roda"

class HelloWorld < Roda
  route do |r|
    r.root do
      "Hello World!"
    end
  end
end

APP = HelloWorld.app
run APP
