// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped

record R {
  var a = 3
}

extend R{
	func c(b : Int64): Int64 {
	  this.a = b //EXPECTED: regex instance member variable 'a' cannot be modified in immutable function
	  return this.a
	}
}

func main() {
  var b = R()
  b.c(99)
  return (b.a - 99)
}