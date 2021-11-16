// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex  override function 'getB' does not have an overridden function


open class Base {
	func getA() : Int32 {
		return  1
	}
}

class Data  <: Base {
	override func getB() : Int32 {
		return  2
	}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
