// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan-not 'return' is not allowed here
// ASSERT: regex-auto only named parameters can have a default

func test() {
    func foo(a:Bool=return 0) {}
    return 1
}

func main(): Int64 {
    return test()
}
