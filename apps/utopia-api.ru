require 'utopia/controller'

APP = Utopia::Controller.new(nil)

class Controller < Utopia::Controller::Base
  def process!(request, path)
    if request.get? && path == "/"
      [
        200,
        {"Content-Type" => "text/html"},
        ["Hello World!"]
      ]
    else
      [
        404,
        {"Content-Type" => "text/html"},
        [""]
      ]
    end
  end
end

def APP.load_controller_file(path)
  Controller.new if path == "/"
end

run APP
