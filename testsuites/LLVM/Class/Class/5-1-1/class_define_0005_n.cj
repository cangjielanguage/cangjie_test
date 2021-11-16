// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex expected '<:' to inherit or '{' to open a scope


class Data Data {
    var data: Int32 = 128
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
