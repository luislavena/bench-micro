require 'brooklyn'

class HelloWorld < Brooklyn::App
  get '/' do
    'Hello World!'
  end
end
