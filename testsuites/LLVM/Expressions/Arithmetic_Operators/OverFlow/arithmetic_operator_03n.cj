// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var a1 = 4****4 // EXPECTED: regex expected expression here
    var 4**=**4     // EXPECTED: regex  expected variable pattern, tuple pattern or enum pattern after 'var'
    return 0
}