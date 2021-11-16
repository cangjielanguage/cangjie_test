// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f


class Data {
	var a : Int32 = 1
	var b : Int32 = 2
	init() {
		a = 10
		b = 20
	}

	init(data1 : Int32) {
		this()
	}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
