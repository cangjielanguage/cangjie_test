// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


class Data {
	public func data() : Int32 {
		return  1
	}
	public func get() : Int32 {
		return  data() + 2
	}
}

func run(): Int64 {
	var value : Data = Data() 
	if (value.get() != 3) {
		return 1 
	}
	return 0
}

func main(): Int64 {
    return run()
}
