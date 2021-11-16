// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 's1'

func main(): Int64 {

if ("a"=="b") {
let s1="happy"
}
let s2="test_${s1}"
print(s2)
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace