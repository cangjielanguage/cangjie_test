// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex modifiers 'private' and 'protected' are conflict in interface declaration
class MyClass{
 private protected interface InsideInterface{}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
