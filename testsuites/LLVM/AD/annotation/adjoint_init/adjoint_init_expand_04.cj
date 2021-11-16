// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan The customized adjoint function foo must be top-level function!

@differentiable
record Point {
    @adjoint [primal: Point]
    static func foo(x: Float64) {
        return x
    }

}

func main() {
    Point.foo(1.0)
    return 0
}
