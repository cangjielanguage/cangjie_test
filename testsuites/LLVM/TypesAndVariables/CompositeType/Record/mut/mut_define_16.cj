// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped

record R {
  var a = 3
	operator mut func [](b : Int64): Int64 { //EXPECTED: regex modifiers 'mut' and 'operator' are conflict in function declaration
	  this.a = b
	  return this.a
	}
}

func main() {
  return 0
}