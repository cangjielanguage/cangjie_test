// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    let conditionalExpression = { a : Int64 => if (a > 0) {return 0};return 1}
    return conditionalExpression(1)
}

func main(): Int64 {
    return test()
}
