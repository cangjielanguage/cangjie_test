// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

record Data {
	var a: Int32 = 0
	DataW() {
		a = 3
		b = 4.0
	}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
