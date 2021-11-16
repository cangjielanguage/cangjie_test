// EXEC-PIPE-1:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


class Base {
    public private var a = 1    // EXPECTED: regex modifiers 'public' and 'private' are conflict in variable declaration
}

func main():Int64 {
    return 0
}
