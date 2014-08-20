require "lotus/router"

APP = Lotus::Router.new do
  get "/", to: ->(env) { [200, {'Content-Type'=>'text/html'}, ["Hello World!"]] }
end

run APP
