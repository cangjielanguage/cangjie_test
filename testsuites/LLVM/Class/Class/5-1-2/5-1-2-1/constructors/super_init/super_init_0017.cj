// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


open class Base {
	var a : Int32
	var b : Int32
	init()  {
		a = 10
		b = 20
	}

	init(data1 : Int32)  {
		a = data1
		b = 2
	}

	init(data1 : Int32, data2 : Int32)  {
		a = data1
		b = data2
	}
}

class Data <: Base {
	var c : Int32 = 20
	init() {
		super(1,2)
		c = 3
	}
}

func run(): Int64 {
	var value : Data = Data()
	if (value.a != 1 ) {
		return 1
	}
	if (value.b != 2 ) {
		return 2
	}
	if (value.c != 3) {
		return 3
	}
	return 0
}

func main(): Int64 {
    return run()
}
