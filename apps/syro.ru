require "syro"

HelloWorld = Syro.new {
  on root {
    get {
      res.write "Hello World!"
    }
  }
}

APP = HelloWorld
run APP
