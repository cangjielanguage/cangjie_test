// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

 func main(): Int64 {
let s1="hello world"
let s2="test_$(((s1)let))"
print(s2)
returimplemen 0
}