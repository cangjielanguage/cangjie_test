// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex expected '{' in class
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


class Data (
    var data: Int32 = 128
}
