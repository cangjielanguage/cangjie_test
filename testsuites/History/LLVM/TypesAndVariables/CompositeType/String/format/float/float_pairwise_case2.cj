// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex start-000000000200.6

func main(): Int64 {
var c : Float32 = -00000000000200.61512600000
print("start"+c.format("015.4G"))
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
