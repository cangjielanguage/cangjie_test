// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex  'get' is non-static member, cannot access by type name


class Data {
	private func get() : Int32 {
		return 1
	}
}

func run(): Int64 {
	if (Data.get() != 1) {
		return 1
	}
	return 2
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
