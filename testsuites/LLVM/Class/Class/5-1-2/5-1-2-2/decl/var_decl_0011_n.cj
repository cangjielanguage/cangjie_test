// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f
// ASSERT: regex expected declaration here


class Data {
     var  a : Int32 = 1 public
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
