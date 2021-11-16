// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(): Int64 {
    type mytype = Int32 // EXPECTED: regex type must be declared on toplevel
    var i : mytype = 0
    match (i) {
        case _ => 0
    }
    return 0
}

func main(): Int64 {
    return test()
}
