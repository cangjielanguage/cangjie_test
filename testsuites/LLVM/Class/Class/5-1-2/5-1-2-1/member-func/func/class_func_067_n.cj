// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

open class Base {
	func get() : Int32 { // EXPECTED: regex overridden function 'get' should have 'open' modifier
		return  1
	}
}

class Data  <: Base {
	override func get() : Int32 {
		return  2
	}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
