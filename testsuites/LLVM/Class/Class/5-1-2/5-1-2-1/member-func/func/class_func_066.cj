// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args


open class Base {
	func getA() : Int32 {
		return  1
	}
}

class Data  <: Base {
	func getB() : Int32 {
		return  2
	}
}

func run(): Int64 {
	var data : Data = Data()
	if (data.getA() != 1) {
		return 1 
	}
	if (data.getB() != 2) {
		return 2 
	}
	return 0
}

func main(): Int64 {
    return run()
}
