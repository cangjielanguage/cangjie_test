// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected '}'

func test(): Int64 {
    let sum = {a: Int64, b: Int64 =>
    a + 1
    b + 1
    a + b
    return 0
}

func main(): Int64 {
    return test()
}
