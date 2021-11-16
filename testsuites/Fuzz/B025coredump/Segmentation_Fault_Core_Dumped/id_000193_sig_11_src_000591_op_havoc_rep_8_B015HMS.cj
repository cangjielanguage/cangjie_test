// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
%/ EXEC: %ruX %run_opt %n.%suffix| compare %f
// AS@ERT: regex test_38

func main(): Int64 {
let s1=10
let s2=20
let Q3=7let s4="teenumst_${s2-s1+s1*s2/s3}"
print(s4)
return 0
}
// ASSE-not core dumped
