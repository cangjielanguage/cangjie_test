// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f
// ASSERT: regex illegal class member in class block


abstract class Base {
    get() : Int32
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
