// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex hello world_test

func main(): Int64 {
var s1="new world"
s1 ="hello world"
var s2="te\n"
s2="${s1}_test"
print(s2)
return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace