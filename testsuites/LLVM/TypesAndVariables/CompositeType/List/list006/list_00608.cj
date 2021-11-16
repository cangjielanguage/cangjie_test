// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func test(): Int64 {
    return [[1,1]].size() - 1
}

func main(): Int64 {
    return test()
}
