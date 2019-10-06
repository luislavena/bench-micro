require 'padrino-core'

module HelloWorld
  class App < Padrino::Application
    get :root, map: '/' do
      "Hello World!"
    end
  end
end

Padrino.mount('HelloWorld::App').to('/')

APP = Padrino.application

run APP
