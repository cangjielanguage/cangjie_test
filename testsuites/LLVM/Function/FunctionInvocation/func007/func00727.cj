// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(){
    return
}

func main(): Int64 {
    test()
    return 0
}
