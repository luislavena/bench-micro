require 'sinatra/base'

class HelloWorld < Sinatra::Base
  get '/' do
    'Hello World!'
  end
end
