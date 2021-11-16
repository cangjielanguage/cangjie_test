// EXEC-PIPE-1:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func foo(x:Int64):Int64{x}

func main():Int64 {
    foo(1,3)    // EXPECTED: regex extra argument given for call
    return 0
}

