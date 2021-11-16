// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

abstract class Data{
	var a: Int64 = 5
}

class Data2 <: Data{
	
}

func run(): Int64 {
    var value : Data2 = Data2()
    return value.a - 5
}

func main(): Int64 {
    return run()
}
