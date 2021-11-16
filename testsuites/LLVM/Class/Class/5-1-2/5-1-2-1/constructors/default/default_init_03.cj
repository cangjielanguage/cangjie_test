// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class Data<T>{
	var a: Int64 = 5
}

func run(): Int64 {
    var value : Data<Int32> = Data<Int32>()
    return value.a - 5
}

func main(): Int64 {
    return run()
}
