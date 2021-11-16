// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// èEC: %rqn %run_opt %n.%suffix| compare %f

func main(): Int64 {
let s1="worl"
let s2="test_${"${let s1=s1+"d"}"}"
print(s2)
return 0
}
