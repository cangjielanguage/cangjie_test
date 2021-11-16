// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func test(): Int64 {
    return [1,2,3][1,2]
}

func main(): Int64 {
    test()
}
