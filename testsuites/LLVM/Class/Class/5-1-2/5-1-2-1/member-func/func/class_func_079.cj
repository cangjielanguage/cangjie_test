// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


open class Base {
	protected open func get() : Int32 {
		return 1
	}
}

class Data <: Base {
	protected override func get() : Int32 {
		return 2 
	}
	func f() :Int32 {
		return get() + 1
	}
}

func run(): Int64 {
	var value : Data = Data() 
	if (value.f() != 3) {
		return 1 
	}
	return 0
}

func main(): Int64 {
    return run()
}
