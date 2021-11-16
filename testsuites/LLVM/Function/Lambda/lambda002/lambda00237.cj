// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    let tryExpression = { a : Int64 =>
    try  {return 1}
    finally {return 0}
    }
    return 0
}

func main(): Int64 {
    return test()
}
