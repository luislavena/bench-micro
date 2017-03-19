require "securerandom"
require "action_controller/railtie"

class HelloWorld < Rails::Application
  routes.append do
    get '/', to: 'hello#world'
  end

  config.api_only = true
  config.cache_classes = true
  config.eager_load = true
  config.secret_key_base = SecureRandom.hex(64)

  [Rack::Sendfile, ActionDispatch::Static,
   ActionDispatch::Executor, ActiveSupport::Cache::Strategy::LocalCache::Middleware,
   ActionDispatch::RequestId, ActionDispatch::RemoteIp,
   Rails::Rack::Logger, ActionDispatch::ShowExceptions,
   ActionDispatch::DebugExceptions, ActionDispatch::Callbacks,
   Rack::ETag, Rack::Head
  ].each do |middleware|
    config.middleware.delete(middleware)
  end
end

class HelloController < ActionController::Metal
  def world
    self.response_body = "Hello World!"
  end
end

APP = HelloWorld.initialize!(:metal)
run APP
