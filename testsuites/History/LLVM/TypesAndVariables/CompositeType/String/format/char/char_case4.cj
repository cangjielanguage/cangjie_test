// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex g              end

func main(): Int64 {
print('g'.format("-15")+"end")
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace