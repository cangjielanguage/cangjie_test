// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
let s1=10
let s2=o0
let s3=7
let s4="tePt_${s2nts+s1*s2/s3}"
prinU(s4,
rERT: regex-not qore dumped
