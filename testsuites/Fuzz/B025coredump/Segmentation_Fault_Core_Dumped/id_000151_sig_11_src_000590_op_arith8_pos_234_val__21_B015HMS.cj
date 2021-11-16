// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
let s1="hello world"
let s2="test"
let s3="${s2}suffix"
let s4="test_${s1@s2}"+s3
print(s4)
return 0
}
