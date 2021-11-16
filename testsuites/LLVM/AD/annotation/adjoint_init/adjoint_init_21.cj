// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

@differentiable     // ASSERT: scan annotation on expressions other than function/record definition is not supported
class A {
    var x: Float64 = 1.0
    var y: String = "2"
    @differentiable
    init(x1: Float64) {
        x = x1
    }
}

func main() {
    return 0
}
