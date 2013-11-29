require "rails"
require "rails/all"

class HelloWorld < Rails::Application
  routes.append do
    root "hello#world"
  end

  config.cache_classes = true
  config.eager_load = true
  config.secret_key_base = "49837489qkuweoiuoqwehisuakshdjksadhaisdy78o34y138974xyqp9rmye8yrpiokeuioqwzyoiuxftoyqiuxrhm3iou1hrzmjk"

  ["Rack::Lock", "ActionDispatch::Flash", "ActionDispatch::BestStandardsSupport",
   "Rack::Sendfile", "ActionDispatch::Static", "Rack::MethodOverride",
   "ActionDispatch::RequestId", "Rails::Rack::Logger",
   "ActionDispatch::ShowExceptions", "ActionDispatch::DebugExceptions",
   "ActionDispatch::RemoteIp", "ActionDispatch::Callbacks",
   "ActionDispatch::Cookies",  "ActionDispatch::Session::CookieStore",
   "ActionDispatch::ParamsParser", "Rack::Head", "Rack::ConditionalGet",
   "Rack::ETag"].each do |middleware|
    config.middleware.delete(middleware)
  end
end

class HelloController < ActionController::Metal
  include ActionController::Rendering

  def world
    render text: "Hello World!"
  end
end

HelloWorld.initialize!
run HelloWorld
