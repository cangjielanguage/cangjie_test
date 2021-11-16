// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex call to 'this' must be first expression in constructor of class 'Data'


class Data {
	var a : Int32 = 1
	var b : Int32 = 2
	init() {
		a = 10
		b = 20
	}

	init(data1 : Int32) {
		a = 100
		this()
	}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
