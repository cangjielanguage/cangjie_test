// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex a              end

func main(): Int64 {
var f:Char = 'a'
print(f.format("-15")+"end")
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace