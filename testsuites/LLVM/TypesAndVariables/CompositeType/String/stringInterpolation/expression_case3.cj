// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex test_true

func main(): Int64 {
let s1=3
let s3=2
let s2="test_${s1 >= s3}"
print(s2)
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace