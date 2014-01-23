require 'hobbit'

class HelloWorld < Hobbit::Base
  get '/' do
    'Hello World!'
  end
end
