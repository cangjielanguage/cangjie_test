// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


open class Base {
	protected func f() : Int32 {
		return  1
	}
}

class Data <: Base {
	func get() {
		f() + 1
	}
}

func run(): Int64 {
	var data : Data = Data()
	if (data.get() != 2) {
		return 1
	}
	return 0
}

func main(): Int64 {
    return run()
}

