require "mustermann/router/rack"

APP = Mustermann::Router::Rack.new do
  on '/' do |env|
    [200, {'Content-Type' => 'text/plain'}, ['Hello World!']]
  end

  on '/:name' do |env|
    name = env['mustermann.params']['name']
    [200, {'Content-Type' => 'text/plain'}, ["Hello #{name}!"]]
  end
end

run APP
