// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped

record R {
  var a = 3
	mut static func c(b : Int64) { // EXPECTED: regex modifiers 'static' and 'mut' are conflict in function declaration
	  this.a = b // EXPECTED: regex non-static variable 'this' cannot be referenced from a static context
	}
}
