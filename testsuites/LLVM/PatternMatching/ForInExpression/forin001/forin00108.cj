// ERRCHECK: %compiler %cmp_opt %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(): Int64 {
    let myList: Array<Int32> = @{0,1,2}
    for (i in myList) if (@) {  // EXPECTED: regex-auto  missing ')' in patternGuard expression
        return 0
        i = i + 1
    return 1
}

func main(): Int64 {
    return test()
}
