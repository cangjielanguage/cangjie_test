// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan-not 'return' is not allowed here
// ASSERT: regex-auto only named parameters can have a default

func test() {
    func foo(a:Bool=return 0,b:Bool=return 1) {}
    return 2
}

func main(): Int64 {
    return test()
}
