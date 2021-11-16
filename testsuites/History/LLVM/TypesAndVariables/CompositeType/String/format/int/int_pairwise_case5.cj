// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex start   0x00000000c8

func main(): Int64 {
let c : Int32 = 200
print("start"+c.format("#15.10x"))
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
