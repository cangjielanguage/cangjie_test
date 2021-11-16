// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex -2.12346

func main(): Int64 {
var c : Float32 = -2.123456123456
print(c.format(".5"))
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
