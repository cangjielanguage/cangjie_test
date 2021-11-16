// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex 'init' is keyword not identifier


class Data {
	var a: Int32 = 0
	func init() {
		a = 3
		b = 4.0
	}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
