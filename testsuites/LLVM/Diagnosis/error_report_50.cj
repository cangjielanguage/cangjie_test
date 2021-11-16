// EXEC-PIPE-1:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main():Int64 {
    var a =1;
    var b = a =2 // EXPECTED: regex continuous assignment is not allowed
    return 0
}

