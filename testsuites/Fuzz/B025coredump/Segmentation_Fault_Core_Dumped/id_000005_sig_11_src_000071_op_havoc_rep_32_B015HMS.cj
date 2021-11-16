// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
 =<"\u{ÿ3456789}t64fnc   retrn 1
}    
// ASSERT     (                     gex-nt stack trace
