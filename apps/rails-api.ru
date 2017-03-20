require "securerandom"
require "action_controller/railtie"

class HelloWorld < Rails::Application
  routes.append do
    get "/", to: "hello#world"
  end

  config.api_only = true
  config.cache_classes = true
  config.eager_load = true
  config.secret_key_base = SecureRandom.hex(64)
  config.action_controller.perform_caching = true
end

class HelloController < ActionController::API
  def world
    self.response_body = "Hello World!"
  end
end

APP = HelloWorld.initialize!
run APP
