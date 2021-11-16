// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check the return type
func a() : Int64 {
    var x : Int64 = 0
    return x
}

func main(): Int64 {
    var x = a()
    return x
}