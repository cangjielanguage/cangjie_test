// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test():Int32{
    return 1
}

func main(): Int64 {
    var a : Int32 = 1
    var MyTuple : Int32*Int32 = (a,test())
    return 0
}
