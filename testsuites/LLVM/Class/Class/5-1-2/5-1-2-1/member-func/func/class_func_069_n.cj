// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex  modifiers 'public' and 'private' are conflict in function declaration


class Data {
	public private func get() : Int32 {
		return  1
	}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
