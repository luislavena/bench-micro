require 'plezi'

class HelloWorld
  def index
    "Hello World!".freeze
  end
end

Plezi.route "/", HelloWorld
APP = Plezi.app
run APP
