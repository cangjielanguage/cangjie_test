// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan-not 'return' is not allowed here

func test() {
    var a : Int64 = return
    var b : Int64 = return
}

func main(): Int64 {
    test()
    return 0
}
