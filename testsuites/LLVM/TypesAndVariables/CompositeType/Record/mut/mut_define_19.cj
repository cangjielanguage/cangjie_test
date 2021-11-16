// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped

class R {
  var a = 3
}

extend R{
	mut func c(b : Int64): Int64 { //EXPECTED: regex 'mut' modifier is illegal for function declaration in extend body of 'R'
	  this.a = b
	  return this.a
	}
}

func main() {
  var b = R()
  b.c(99)
  return (b.a - 99)
}