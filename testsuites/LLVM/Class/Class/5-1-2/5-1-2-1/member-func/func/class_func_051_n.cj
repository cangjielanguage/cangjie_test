// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call


open class Base {
	private func f() : Int32 {
		return 1
	}
}

class Data <: Base {
	private func get() : Int32 {
		return f()
	}
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
