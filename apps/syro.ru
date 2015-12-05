require "syro"

APP = Syro.new {
  get {
    res.write "Hello World!"
  }
}

run APP
