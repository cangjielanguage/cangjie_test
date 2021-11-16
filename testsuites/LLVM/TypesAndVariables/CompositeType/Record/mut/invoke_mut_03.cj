// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

record R {
  var a: Int64
  mut public func c(b : Int64): Int64 {
	  cc(b)
	}

	mut private func cc(b : Int64): Int64 {
	  this.a = b
	  return this.a
	}
}

func main() {
  var b = R(a: 2)
  b.c(99)
  return (b.a - 99)
}