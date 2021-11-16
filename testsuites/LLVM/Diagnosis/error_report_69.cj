// EXEC-PIPE-1:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func foo<T>(){}


func main() {
     var a = 2%0   // EXPECTED: regex mod by 0

    return 0
}