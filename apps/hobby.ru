require 'hobby'

class App
  include Hobby
  get { "Hello World!" }
end

APP = App.new
run APP
