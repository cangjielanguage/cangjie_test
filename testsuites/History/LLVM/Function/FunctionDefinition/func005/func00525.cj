// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Set<Int64>{
    let a : Set<Int64> = #{1}
    return a
}

func main(): Int64 {
    test()
    return 0
}
