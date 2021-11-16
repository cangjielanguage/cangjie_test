// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex test_hello worldtesttestsuffix

func main(): Int64 {
let s1="hello world"
let s2="test"
let s3="${s2}suffix"
let s4="test_${s1+s2}"+s3
print(s4)
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace