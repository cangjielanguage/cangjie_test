// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


open class Base {
	protected open func get() : Int32 {
		return 1
	}
}

class Data <: Base {
	public override func get() : Int32 {
		return 2 
	}
}

func run(): Int64 {
	var value : Data = Data() 
	if (value.get() != 2) {
		return 1 
	}
	return 0
}

func main(): Int64 {
    return run()
}
