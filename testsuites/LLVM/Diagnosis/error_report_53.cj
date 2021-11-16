// EXEC-PIPE-1:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


class Base {
    public prop var d:Int64{
        set() {}
        set() {} // EXPECTED: regex property already has a setter
    }
}

func main():Int64 {
    return 0
}
