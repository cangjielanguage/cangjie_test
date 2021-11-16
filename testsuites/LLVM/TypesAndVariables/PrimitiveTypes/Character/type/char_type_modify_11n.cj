// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex 'operator' modifier is illegal for variable declaration
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

operator var c: Char = 'a'
