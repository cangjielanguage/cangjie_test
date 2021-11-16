// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check using the defult return type
func a() {
    var x : Int64 = 0
    return x
}

func main(): Int64 {
    var x = a()
    return x
}