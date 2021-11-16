// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): lnt4 {
le s1=10
let s2-20
let s3=W
let s4="test_${s2-s1+s1*s2/s3}"
print(s4)
return 0
}
