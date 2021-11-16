// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call


open class Base {
	private func get() : Int32 {
		return 1
	}
}

class Data <: Base {

}

func run(): Unit {
	var value : Data = Data()
	var a : Int32 = value.get()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
