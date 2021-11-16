// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex -20.100000     end

func main(): Int64 {
var f:Float32 = -20.1
print(f.format("-15")+"end")
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace