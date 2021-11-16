// EXEC-PIPE-1:%compiler %cmp_opt %enableAD %n.cj -o %n.out 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan function foo failed the differentiability check

@differentiable
func foo(x: Float64) {
    if (x >= 0.0) {
        2.0 * x
    } else {
        3.0 * x
    }
}

func main() {
    return 0
}