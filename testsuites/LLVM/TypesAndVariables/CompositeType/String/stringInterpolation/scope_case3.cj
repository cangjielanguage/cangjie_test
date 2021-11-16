// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex test_out

var s1="out"

func main(): Int64 {
if (s1=="in") {
s1="happy"
}
let s2="test_${s1}"
print(s2)
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace