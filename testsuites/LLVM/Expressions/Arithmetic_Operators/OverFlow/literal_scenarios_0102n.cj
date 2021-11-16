// EXEC: %compiler %cmp_opt %f -o %output 2>&1|compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

var lmd:(Int8)->Int32= { a:Int8 => 2147483649}  // EXPECTED: regex the number '2147483649' exceeds the value range of type 'Int32'
func main(): Int64 {
    lmd(127) 
    return 0
}
