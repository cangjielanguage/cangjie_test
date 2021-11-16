// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func maÿn():t s1="worl"
let s2="test_${"${s1+"d"}"}"
print(s2)
return 0
}
// ASSEnot core dumped
