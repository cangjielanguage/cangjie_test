// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex unmatched '}'

func main(): Int64 {
let s1="hello world"
let s2="test_${s1)"
print(s2)
return 0
}
