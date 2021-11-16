// EXEC-PIPE-1:%compiler %cmp_opt %enableAD %n.cj -o %n.out 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@differentiable
func foo(x: Float64) { // EXPECTED: regex multiple returns are not supported by AD yet
    if (stopGradient<Float64>(x) >= 0.0) {
        return 2.0 * x
    } else {
        return 3.0 * x
    }
}


func main() {
    return 0
}