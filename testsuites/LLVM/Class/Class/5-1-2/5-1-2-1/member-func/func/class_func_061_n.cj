// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f


class Data {
	static var a : Int32 = 1
	init() {

	}

	static func get() : Int32 {
		return  this.a // EXPECTED: regex non-static variable 'this' cannot be referenced from a static context
	}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

