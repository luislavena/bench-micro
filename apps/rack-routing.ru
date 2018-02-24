require "rack/routing"

ROUTES = [ Rack::Routing::Route.new( "GET /" )]

class App
  def call env
    request = Request.new( env )
    request.response
  end
end

class Request
  def initialize env
    @env = env
    @request = Rack::Request.new( env )
  end

  def response
    routing = Rack::Routing::Router.for( @env )
    @url_params = routing[ :params ]
    
    rh = RouteHandler.new( @env, @params, @url_params)
    rh.send routing[ :method ]
  end
end

class RouteHandler
  def initialize env, params, url_params
    @env = env
    @params = params
    @url_params = url_params
  end

  def get_root
    [ 200, {}, [ "Hello World!" ]]
  end

  def not_found
    [ 404, {}, [] ]
  end
end

APP = App.new
run APP
