// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


class Data {
	static func get() : Int32 {
		return  1
	}
}

func run(): Int64 {
	if (Data.get() != 1) {
		return 1 
	}
	return 0
}

func main(): Int64 {
    return run()
}
