// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex -10.51

func main(): Int64 {
var c : Float32 = -1.051000E01
print(c.format("g"))
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
