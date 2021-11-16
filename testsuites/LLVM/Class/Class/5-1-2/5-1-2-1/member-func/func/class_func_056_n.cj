// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex  no matching function declaration for function call


class Base {
	protected func get() : Int32 {
		return  1
	}
}

class Data <: Base {

}

func run(): Int64 {
	var data : Data = Data()
	if (data.get() != 1) {
		return 1
	}
	return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
