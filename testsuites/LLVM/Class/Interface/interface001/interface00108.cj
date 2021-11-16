// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex 'internal' modifier is illegal for interface declaration in class body
class MyClass{
  internal interface InsideInterface{}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
