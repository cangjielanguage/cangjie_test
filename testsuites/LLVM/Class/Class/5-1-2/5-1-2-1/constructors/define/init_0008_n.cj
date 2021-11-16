// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f


class Data {
	var a: Int32  = 0
	init() : Int32 { // ASSERT: regex there should be no return value type in a constructor
		a = 1
		return 0
	}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
