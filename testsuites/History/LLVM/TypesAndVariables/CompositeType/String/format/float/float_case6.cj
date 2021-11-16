// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex -200852

func main(): Int64 {
var c : Float32 = -200852.23
print(c.format(""))
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace