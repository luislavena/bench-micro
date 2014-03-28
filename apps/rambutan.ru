require 'rambutan'

class HelloController < Rambutan::Base
  def world
    "Hello World!"
  end
end

app = Rambutan::RoutesSet.new do
  get '/' => 'hello#world'
end

APP = app.router
run APP
