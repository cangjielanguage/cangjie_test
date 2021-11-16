// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(a:Int64,b:Int64,c:Int64){return 0}

func main(): Int64 {
    return test(0,0,0)
}
