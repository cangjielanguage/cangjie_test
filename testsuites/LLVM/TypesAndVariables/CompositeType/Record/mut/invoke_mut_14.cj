// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

record R {
  var a: Unit = ()
  mut public func c(b : Unit): Unit {
	  a = b
	  return a
	}
}

func main() {
  var b = R()
  b.c(())
  return 0
}