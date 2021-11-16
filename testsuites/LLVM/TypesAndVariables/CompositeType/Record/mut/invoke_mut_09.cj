// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

record R {
  var a: UInt32 = 3
  mut public func c(b : UInt32): UInt32 {
	  this.a = b
	  return this.a
	}
}

func main() {
  var b = R()
  b.c(99)
  return Int64(b.a - 99)
}