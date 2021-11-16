// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

record R {
  var a: Float64 = 3.0
  mut public func c(b : Float64): Float64 {
	  this.a = b
	  return this.a
	}
}

func main() {
  var b = R()
  b.c(99.0)
  return Int64(b.a - 99.0)
}