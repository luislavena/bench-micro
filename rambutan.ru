require File.expand_path('../apps/rambutan', __FILE__)

app = Rambutan::RoutesSet.new do
  get '/' => 'hello#world'
end

run app.router
