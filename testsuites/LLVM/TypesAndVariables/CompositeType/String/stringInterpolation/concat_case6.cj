// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex test_-37

func main(): Int64 {
let s1=10
let s2=20
let s3=7
let s4="test_${s2-(s1+s1)*s2/s3}"
print(s4)
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace