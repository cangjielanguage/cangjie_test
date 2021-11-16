// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex modifiers 'private' and 'protected' are conflict in function declaration


class Data {

	 private protected func get() : Int32 {
		return 1
	}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
