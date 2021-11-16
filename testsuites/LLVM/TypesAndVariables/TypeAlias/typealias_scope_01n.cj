// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func test(): Int64 {
    type int = Int64  // EXPECTED: regex type must be declared on toplevel
    var i1: Int64 = 1
    var i2: int = 2
    var res: int = i1 + i2
    if (res == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return test()
}