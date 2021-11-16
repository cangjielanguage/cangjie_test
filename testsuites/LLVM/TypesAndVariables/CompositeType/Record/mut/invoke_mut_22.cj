// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dumped

record R<T>{
  R(var a: T){

  }

  mut public func c(b : T) {
	  a = b
	  return a
	}
}

func main() {
  var b = R<Int64>(6)
  b.c(7)
  return b.a - 7
}