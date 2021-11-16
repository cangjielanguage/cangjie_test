// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(): Range{
    var a = -10...10:2
 in(): Int64 {
    test()

   rEC: %compiler %cmp_opt %f -o %t
