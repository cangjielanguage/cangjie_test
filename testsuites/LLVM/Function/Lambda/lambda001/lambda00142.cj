// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(): Int64 {
    type mytype = Int64 // EXPECTED: regex type must be declared on toplevel
    let sum = { a: mytype => a}
    return 0
}

func main(): Int64 {
    return test()
}
