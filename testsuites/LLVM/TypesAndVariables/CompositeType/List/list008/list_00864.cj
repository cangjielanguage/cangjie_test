// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(a!:List<Int64> = [0]){
    return a[0]
}

func main(): Int64 {
    return test()
}
