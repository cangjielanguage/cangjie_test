// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex modifiers 'public' and 'protected' are conflict in function declaration


class Data {
	public protected func get() : Int32 {
		return  1
	}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
