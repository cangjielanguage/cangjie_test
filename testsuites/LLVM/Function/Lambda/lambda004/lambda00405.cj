// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex type of function body is incompatible with return type
func test(): Int64 {
    let test : Int64 = 1
    return 0
}

func main(): Int64 {
    let lambda = { a: Int64 => test - a}
    return lambda(1)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
