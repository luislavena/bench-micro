require "grape"

class APP < Grape::API
  get '/' do
    "Hello World!"
  end
end

run APP
