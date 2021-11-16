// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped

interface A{
	mut func c(b : Int64): Int64 


	mut func cc(b : Int64): Int64 {
	  c(b)
	}
}

record R <: A {
  func c(b : Int64): Int64 { // EXPECTED: regex 'mut' modifier of 'c' is incompatible with that in interface 'A'
	  return 1
	}

	func cc(b : Int64): Int64 { // EXPECTED: regex 'mut' modifier of 'cc' is incompatible with that in interface 'A'
	  c(b)
	}
}
