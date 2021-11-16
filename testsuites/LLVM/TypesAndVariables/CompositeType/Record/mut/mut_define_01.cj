// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not core dumped

mut func a(){ //EXPECTED: regex 'mut' modifier is illegal for function declaration in top level
	
}