// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-auto '<:' to inherit or '{' to open a scope


class Data Cat {
    var data: Int32 = 128
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
