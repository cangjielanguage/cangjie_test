// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex  illegal object in toplevel, toplevel must consist of declaration or definition


Class Data {
	var data: Int32 = 128
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
