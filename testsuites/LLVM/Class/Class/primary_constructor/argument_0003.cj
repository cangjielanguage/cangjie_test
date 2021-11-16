// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class Data {
var b: Float64
	Data(var a: Int32)  {
		this.a = a
		b = 2.0
	}
}

func run(): Int64 {
	var value : Data = Data(1);
	if ((value.a == 1) &&  (value.b == 2.0)) {
		return 0
	}
	else {
		return 1
	}
}

func main(): Int64 {
    return run()
}
