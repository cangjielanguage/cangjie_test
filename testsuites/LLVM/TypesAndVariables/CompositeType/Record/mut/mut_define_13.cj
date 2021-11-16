// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

interface A{
	mut func c(b : Int64): Int64 


	mut func cc(b : Int64): Int64 {
	  c(b)
	}
}

class R <: A {
  var a = 3
	func c(b : Int64): Int64 {
	  this.a = b
	  return this.a
	}
}

func main() {
  var a = R()
  a.cc(9)
  var b = R()
  b.c(99)
  return (a.a - 9 + b.a - 99)
}