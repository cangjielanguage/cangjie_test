// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex end\+2147483647

func main(): Int64 {
var c : Int32 = 2147483647
print("end"+c.format("+2"))
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace