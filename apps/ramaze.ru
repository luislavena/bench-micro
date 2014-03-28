require "ramaze"

class HelloWorld < Ramaze::Controller
  map "/"

  def index
    "Hello World!"
  end
end

run Ramaze.core
