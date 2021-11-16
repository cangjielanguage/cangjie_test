// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex  do not weaken access privilege 'protected' for function 'get' in 'Base'


open class Base {
	protected open func get() : Int32 {
		return 1
	}
}

class Data <: Base {
	override private  func get() : Int32 {
		return 1
	}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
