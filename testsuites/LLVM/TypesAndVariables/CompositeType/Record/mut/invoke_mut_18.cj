// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

record RR{
	var a: Int64 = 3
}

record R {
  var a: RR = RR()
  mut public func c(b : RR): RR {
	  a = b
	  return a
	}
}

func main() {
  var b = R()
  b.c(RR(a: 98))
  return b.a.a - 98
}