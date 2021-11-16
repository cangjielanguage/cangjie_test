// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    let optionConstructorExpr = { a : Int64 => None<Int64>}
    return 0
}

func main(): Int64 {
    return test()
}
