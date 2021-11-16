// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex 200.2

func main(): Int64 {
var c : Float32 = 00000000000200.2000000000000000000000
print(c.format("g"))
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace