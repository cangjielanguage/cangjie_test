// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

record R {
  var a: () -> Int64 = {3}
  mut public func c(b : () -> Int64) {
	  a = b
	  return a
	}
}

func main() {
  var b = R()
  b.c({98})
  return b.a() - 98
}