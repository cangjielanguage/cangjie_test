// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex test_world

func main(): Int64 {
let s1="worl"
let s2="test_${"${s1+"d"}"}"
print(s2)
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace