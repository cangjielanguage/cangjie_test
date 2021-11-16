// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-auto multi-line raw string literal: too many '#' in closing delimiter
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var str: String = #"Hello\n Char Lang"##