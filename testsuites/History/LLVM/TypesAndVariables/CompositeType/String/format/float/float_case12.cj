// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex -00000002.120000

func main(): Int64 {
var c : Float32 = -2.12
print(c.format("016"))
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
