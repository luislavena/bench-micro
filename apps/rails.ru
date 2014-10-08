require "securerandom"
require "action_controller/railtie"
require "rails/test_unit/railtie"

class HelloWorld < Rails::Application
  routes.append do
    get "/", to: "hello#world"
  end

  config.cache_classes = true
  config.eager_load = true
  config.secret_key_base = SecureRandom.hex(64)

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
  def world
    self.response_body = "Hello World!"
  end
end

APP = HelloWorld.initialize!
run APP
