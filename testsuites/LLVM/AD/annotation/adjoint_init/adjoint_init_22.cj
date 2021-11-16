// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump


class A {
    var x: Float64 = 1.0
    var y: String = "2"
    @differentiable
    init(x1: Float64) {     // ASSERT: scan differentiable function init can't return non-differentiable type A
        x = x1
    }
}

func main() {
    return 0
}
