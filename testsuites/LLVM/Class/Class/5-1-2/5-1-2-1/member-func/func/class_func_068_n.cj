// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex need 'override' modifier for function 'get'


open class Base {
	func get() : Int32 {
		return  1
	}
}

class Data  <: Base {
	func get() : Int32 {
		return  2
	}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
