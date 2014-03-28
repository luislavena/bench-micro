require "lotus/router"

app = Lotus::Router.new do
  get "/", to: ->(env) { [200, {}, ["Hello World!"]] }
  get "/:name", to: ->(env) { [200, {}, ["Hello name!"]] }
end

run app
