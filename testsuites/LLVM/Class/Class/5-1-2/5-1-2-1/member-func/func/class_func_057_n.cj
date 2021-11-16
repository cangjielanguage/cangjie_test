// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex function 'get' can not be abstract


class Data {
	func get() 
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
