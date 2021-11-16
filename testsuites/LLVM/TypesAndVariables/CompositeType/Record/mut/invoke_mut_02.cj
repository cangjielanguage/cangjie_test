// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

record R {
  var a = 3
  mut private func c(b : Int64): Int64 {
	  this.a = b
	  return this.a
	}
}

func main() {
  var b = R()
  b.c(99) //EXPECTED: regex no matching function declaration for function call 'c'
  return (b.a - 99)
}