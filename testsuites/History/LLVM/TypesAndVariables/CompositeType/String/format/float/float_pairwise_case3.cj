// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex start   -200.3669586182

func main(): Int64 {
var c : Float32 = -200.366953
print("start"+c.format("+18.10"))
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
