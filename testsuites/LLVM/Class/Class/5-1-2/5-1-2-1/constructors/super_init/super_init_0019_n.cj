// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex  call to 'super' must be first expression in constructor of class 'Data'


open class Base {
	var a : Int32
	init()  {
		a = 10
	}
}

class Data <: Base {
	var b : Int32 = 20
	init() {
		b = 3
	}

	init(data1 : Int32) {
		b = data1
		super()
	}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
