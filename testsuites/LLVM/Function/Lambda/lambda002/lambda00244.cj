// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(): Int64 {
    let ty = {  =>
    type mytype = Int64 // EXPECTED: regex type must be declared on toplevel
    }
    return 0
}

func main(): Int64 {
    return test()
}
