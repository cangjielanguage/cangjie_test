// EXEC-PIPE-1:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func foo(x!: Int64, y!: Int64) {}


func main() {
    foo(x:1,x:1)   // EXPECTED: regex named argument prefix 'x:' cannot appeared more than once in call

    return 0
}