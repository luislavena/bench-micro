require "mustermann/router/rack"

APP = Mustermann::Router::Rack.new do
  on '/' do |env|
    if env['REQUEST_METHOD'] == 'GET'
      [200, {'Content-Type' => 'text/html'}, ['Hello World!']]
    else
      [404, {'Content-Type' => 'text/html'}, []]
    end
  end
end

run APP
