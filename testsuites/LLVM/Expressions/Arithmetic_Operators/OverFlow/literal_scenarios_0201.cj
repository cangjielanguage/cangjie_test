// EXEC: %compiler %cmp_opt %f -o %output 2>&1|compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

var lmd = { a:Int8,b:Int8 => Int32(b)}
func main(): Int64 {
    lmd(123,134)    // EXPECTED: regex the number \'134\' exceeds the value range of type \'Int8\'
    return 0
}
