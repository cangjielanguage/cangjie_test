// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
let s1="worl"
let s2="test_${"${let"d"}"}"
print(s2)
return 0
}
