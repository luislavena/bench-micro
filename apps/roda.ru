require "roda"

class HelloWorld < Roda
  route do |r|
    r.get "" do
      "Hello World!"
    end
  end
end

APP = HelloWorld.app
run APP
