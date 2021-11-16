// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex end  -2147483648.000000

func main(): Int64 {
var c : Float32 = -2147483645.3
print("end"+c.format("+20"))
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace