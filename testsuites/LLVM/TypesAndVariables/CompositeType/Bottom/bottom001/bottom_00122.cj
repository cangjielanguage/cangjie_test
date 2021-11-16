// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface I{}

func test() {
    var x : I // type here
    x = return // EXPECTED: regex expression of Nothing type cannot appear here currently
}

func main(): Int64 {
    test()
    return 0
}
