// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped

interface A{
	static mut func c(b : Int64): Int64 //EXPECTED: regex modifiers 'static' and 'mut' are conflict in function declaration


	static mut func cc(b : Int64): Int64 { //EXPECTED: regex modifiers 'static' and 'mut' are conflict in function declaration


	}
}