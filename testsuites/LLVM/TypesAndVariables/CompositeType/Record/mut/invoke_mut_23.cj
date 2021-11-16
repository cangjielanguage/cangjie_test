// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped

record R<T>{
  R(let a: T){

  }

  mut public func c(b : T) {
	  a = b  //EXPECTED: regex cannot assign to value which is an initialized 'let' constant
	  return a
	}
}

func main() {
  var b = R<Int64>(6)
  b.c(7)
  return b.a - 7
}