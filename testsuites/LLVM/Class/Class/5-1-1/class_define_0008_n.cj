// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex expected class name after 'class'


class 1Data {
    var data: Int32 = 128
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
