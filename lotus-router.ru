require "lotus/router"

app = Lotus::Router.new do
  get "/", to: ->(env) { [200, {}, ["Hello World!"]] }
end

run app
