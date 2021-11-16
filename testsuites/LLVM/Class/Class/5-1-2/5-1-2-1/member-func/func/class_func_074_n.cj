// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex overridden function 'get' should have 'open' modifier


open class Base {
	func get() : Int32 {
		return 1
	}
}

class Data <: Base {
	 private override func get() : Int32 {
		return 1
	}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
