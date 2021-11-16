// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex modifiers 'public' and 'private' are conflict in interface declaration
class MyClass{
 private public interface InsideInterface{}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
