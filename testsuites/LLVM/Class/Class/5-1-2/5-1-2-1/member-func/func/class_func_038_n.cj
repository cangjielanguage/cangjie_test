// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex  override function 'get' does not have an overridden function


open class Base {

}

class Data <: Base {
	override func get() : Int32 {
		return 1
	}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
