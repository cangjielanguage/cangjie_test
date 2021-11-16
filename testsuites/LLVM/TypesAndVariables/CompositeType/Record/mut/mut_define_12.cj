// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped

interface A{
	mut func c(b : Int64): Int64 

	mut func cc(b : Int64): Int64 {
	  c(b)
	}
}

class R <: A {
  var a = 3
	mut func c(b : Int64): Int64 { // EXPECTED: regex 'mut' modifier is illegal for function declaration in class body
	  this.a = b
	  return this.a
	}

	mut func cc(b : Int64): Int64 { // EXPECTED: regex 'mut' modifier is illegal for function declaration in class body
	  this.a = b
	  return this.a
	}
}

func main() {
  return 0
}