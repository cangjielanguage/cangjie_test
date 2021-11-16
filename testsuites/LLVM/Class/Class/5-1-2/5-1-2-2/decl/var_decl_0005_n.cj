// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f
// ASSERT: regex llegal class member in class block


class Data {
    Public var  a  : Int32
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
