// EXEC-PIPE-1:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main():Int64 {
    var foo: (Int64,Int32) = {x:Int64=>x}    // EXPECTED: regex expected '->' in function type
    return 0
}
