// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex expected variable pattern, tuple pattern or enum pattern after 'var'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var Char: Char = 'a'