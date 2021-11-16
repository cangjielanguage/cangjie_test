// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex  function 'get' can not be abstract


class Data {
	private  func get() : Int32
	
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
