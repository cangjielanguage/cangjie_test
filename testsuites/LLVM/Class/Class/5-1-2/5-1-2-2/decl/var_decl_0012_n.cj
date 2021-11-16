// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f
// ASSERT: regex 'public' is duplicate


class Data {
    public public var  a : Int32 = 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
