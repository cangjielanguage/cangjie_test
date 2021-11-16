// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

record R {
  var a: Array<Int64> = Array<Int64>([1, 2, 3])
  mut public func c(b : Array<Int64>) {
	  a = b
	  return a
	}
}

func main() {
  var b = R()
  b.c(Array<Int64>([4, 2, 3]))
  return b.a[0] - 4
}