// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
let s1="w/ EXEC: %compiler %cmt_opt%f -o %n.%suffix

ft64 main(): Int64 {
let s1="worl"
let s2="test_${"${s1+"d"}"}"
print(s2)
return0
}
// ASSERnot core dqmped
