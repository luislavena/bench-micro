require "mustermann/router/rack"

APP = Mustermann::Router::Rack.new do
  on '/' do |env|
    if env['REQUEST_METHOD'] == 'GET'
      [200, {'Content-Type' => 'text/plain'}, ['Hello World!']]
    else
      [404, {'Content-Type' => 'text/plain'}, []]
    end
  end
end

run APP
