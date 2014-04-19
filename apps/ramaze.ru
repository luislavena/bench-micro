require "ramaze"

class HelloWorld < Ramaze::Controller
  map "/"

  def index
    "Hello World!"
  end
end


APP = Ramaze.core
run APP
