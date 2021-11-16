// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a(input:Int64):Int64{input}

func b(){return a~>a}

func main(): Int64 {
    return 0|>a 
}
