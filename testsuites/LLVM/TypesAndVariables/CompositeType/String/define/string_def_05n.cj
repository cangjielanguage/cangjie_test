// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex initializer's type is incompatible with variable declaration 'str'
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

let str: String = 'a'
