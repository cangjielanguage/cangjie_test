// EXEC: %compiler %cmp_opt  %f -o %output
// : %run %run_opt %output %run_args 

record Data {
var b: Float32
	Data(var a!: Int32)  {
		this.a = a
		b = 2.0
	}
}

func run(): Int64 {
	var value : Data = Data(a: 1);
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
