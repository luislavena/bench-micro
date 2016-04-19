require "hanami/router"

APP = Hanami::Router.new do
  get "/", to: ->(env) { [200, {'Content-Type'=>'text/html'}, ["Hello World!"]] }
end

run APP
