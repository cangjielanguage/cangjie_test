// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(a : Map<Int64, String>): Int64 {
    return 0
}

func main(): Int64 {
    let a : Map<Int64, String> = #{0: "test"}
    return test(a)
}
