// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex start     000002147483647

func main(): Int64 {
var c : Int32 = 2147483647
print("start"+c.format("20.15"))
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
