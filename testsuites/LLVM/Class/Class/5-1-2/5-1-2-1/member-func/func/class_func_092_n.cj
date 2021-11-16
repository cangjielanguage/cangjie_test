// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex 'set' is non-static member, cannot be accessed by static function 'get'


class Data {
	static var a : Int32 = 2
	init() {
	}
	func set() : Int32 {
		return  a
	}

	static func get() : Int32 {
		return  set()
	}
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
