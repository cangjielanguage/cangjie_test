// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Map<Int64,String>{
    let a : Map<Int64,String> = #{1:"test"}
    return a
}

func main(): Int64 {
    test()
    return 0
}
