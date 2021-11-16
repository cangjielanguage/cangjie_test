// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var MyTuple = (#{1:1},#{})  // EXPECTED: regex can not infer the specific type
    return 0
}
