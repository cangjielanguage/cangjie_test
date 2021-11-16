// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex modifiers 'public' and 'protected' are conflict in interface declaration
class MyClass{
 protected public interface InsideInterface{}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
