// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex end    -20.100000

func main(): Int64 {
var c : Float32 = -20.1
print("end"+c.format("+14"))
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace