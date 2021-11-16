// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func test(): Int64 {
    let sum = { a, b => a + b}  //EXPECTED: regex parameters of this lambda expression must have type annotations
    return 0
}

func main(): Int64 {
    return test()
}
