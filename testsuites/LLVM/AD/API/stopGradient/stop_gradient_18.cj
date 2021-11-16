// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan annotation on expressions other than function/record definition is not supported


@differentiable
class Point {
    @differentiable[except:[this]]
    func bar(x: Float64) {
        x = x
    }
}


@differentiable
func f(x: Float64): Float64 {
    var p = stopGradient<Point>(Point())
    return x * p.bar(1.0)
}


func main() {
    var x = 2.0
    var dx = grad(f, x)
    if (dx >= 1.000001 || dx <= 0.999999) {
        return 1
    }
    return 0
}

