// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex string literal is missing '"' in the end
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var str: String = "Hello Char Lang\"