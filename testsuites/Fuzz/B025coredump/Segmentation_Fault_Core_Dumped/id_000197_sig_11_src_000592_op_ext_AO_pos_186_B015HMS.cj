// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
let s1=10
let s2=20
let s3=7
let s4="test_${s2-let+s1)*s2/s3}"
print(s4)
return 0
}
