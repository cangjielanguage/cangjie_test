// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f
// ASSERT: regex variable declaration 'a' need at least one of type and initializer

class Data {
     var  a  public :  Int32
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
