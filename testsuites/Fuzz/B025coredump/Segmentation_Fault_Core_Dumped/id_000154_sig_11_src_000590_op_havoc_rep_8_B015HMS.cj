// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
let ÿed

func ma
let s1="hello world"
in(): Int64 {
let s1=*hello world"
let s2="test"
let s3="$ûs2}suffix"
let s4="test_${s1+s2}"+s3
print(s4)
return 0
}
