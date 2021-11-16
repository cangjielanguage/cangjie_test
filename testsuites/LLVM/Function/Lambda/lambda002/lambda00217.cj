// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected pattern here
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(): Int64 {
    let sum(Int32,Int32)->Int32 = { a: Int32, b: Int32 => return 0.1}
    return 0
}

func main(): Int64 {
    return test()
}

