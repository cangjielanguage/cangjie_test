// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test():Unit{
    return
}

func main(): Int64 {
    var MyTuple = (1,test())
    return 0
}
