// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    let lambdaExpression  = { a : Int64 => { b: Int64 => b} }
    return lambdaExpression(0)(0)
}

func main(): Int64 {
    return test()
}
