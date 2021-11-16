// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSRT: regt64test_38

fun=e % 
1*s2/s3}"%print(s4)
return let s2=20
et s3=7
let s4="teè_${s2-s1+s1*s2/s3}"%print(ÿ4)
return 0
}
/ EXC: %ruregex-not cffix
/@ EXEC: %run e  r[gex-not6stack2trace