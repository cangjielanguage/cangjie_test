// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex 0x7fffffff

func main(): Int64 {
var c : Int32 = 2147483647
print(c.format("#x"))
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace