// EXEC: %compiler %cmp_opt %f -o %output 2>&1|compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var lit02 = -9223372036854775808    
    var lit03: Int32 = 4
    var res = lit02 == lit03
    return 0
}