// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

class A{
	A(var a!:Int64 = 9){}
}

record R {
  var a = A()
  mut public func c(b : A): A {
	  a = b
	  return a
	}
}

func main() {
  var b = R()
  b.c(A(a: 20))
  return b.a.a - 20
}