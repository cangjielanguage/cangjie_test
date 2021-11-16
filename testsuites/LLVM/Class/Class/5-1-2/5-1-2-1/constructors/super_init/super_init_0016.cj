// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


open class Base {
	var a : Int32
	init()  {
		a = 1
	}

	init(data1 : Int32)  {
		a = data1
	}
}

class Data <: Base {
	var b : Int32 = 2
	init() {
		super(10)
		b = 20
	}
}

func run(): Int64 {
	var value : Data = Data()
	if (value.a != 10 ) {
		return 1
	}
	if (value.b != 20 ) {
		return 2
	}
	return 0
}

func main(): Int64 {
    return run()
}
