// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

record Data {
	var a: Int32  = 0
	Data() : Data { //EXPECTED: regex there should be no return value type in a constructor
		a = 1
	}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
