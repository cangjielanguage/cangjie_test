// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex too many characters between ''
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var c: Char = 'ab'