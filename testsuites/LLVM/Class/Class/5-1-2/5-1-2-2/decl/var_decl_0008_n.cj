// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f
// ASSERT: regex expected type


class Data {
     var  a : public Int32
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
