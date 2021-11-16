// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int64 {
    return List<Int64>(Array<Int64>(92,0)).size() - 92
}

func main(): Int64 {
    return test()
}
