package pkga

external record Boo {
  var a = 3
  mut public func c(b : Int64): Int64 {
	  this.a = b
	  return this.a
	}
}