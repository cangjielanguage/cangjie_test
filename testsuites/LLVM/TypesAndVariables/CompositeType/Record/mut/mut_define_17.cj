// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

record R {
  var a = 3
}

extend R{
	mut func c(b : Int64): Int64 {
	  this.a = b
	  return this.a
	}
}

func main() {
  var b = R()
  b.c(99)
  return (b.a - 99)
}