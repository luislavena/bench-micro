require 'gin'

class HelloWorldCtrl < Gin::Controller
  def index; "Hello World!"; end
end

class MyApp < Gin::App
  mount HelloWorldCtrl, "/"
end

APP = MyApp.new
run APP
