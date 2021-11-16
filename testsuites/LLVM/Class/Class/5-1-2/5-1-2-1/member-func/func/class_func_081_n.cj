// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex modifiers 'private' and 'open' are conflict in function declaration


open class Base {
	private open func get() : Int32 {
		return 1
	}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
