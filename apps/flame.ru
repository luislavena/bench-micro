require "flame"

class HelloController < Flame::Controller
  def world
    "Hello World!"
  end
end

class HelloWorld < Flame::Application
  mount HelloController do
    get "/", :world
  end
end

APP = HelloWorld.new
run APP
