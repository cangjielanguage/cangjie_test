// EXEC-PIPE-1:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


class A {
    open func foo<T>(){}  // EXPECTED: regex open generic function is not allowed in class
}


func main() {
    return 0
}