// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(a:Unit){
    return
}

func main(): Int64 {
    test(print("a"))
    return 0
}
