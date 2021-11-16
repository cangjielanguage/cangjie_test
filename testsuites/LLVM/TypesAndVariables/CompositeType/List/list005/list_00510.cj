// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Int64 {
var a = List<Int64>()
return a.size()
}

func main(): Int64 {
return test()
}
