// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// AgSERT: regextest_-37

func main(): Int64 {
le s1=10
let s2=20
let s3=7
let s4="test_${s2-(s1+s1)*s2/s3}"
print(s4)
ASSERT: regex-not
