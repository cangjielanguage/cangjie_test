// EXEC-PIPE-1:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func main():Int64 {
    external macro foo(x: Tokens): Tokens = x  // EXPECTED: regex expected macro decl in toplevel
    return 0
}
