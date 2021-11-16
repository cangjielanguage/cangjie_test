// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan annotation on expressions other than function/record definition is not supported


@differentiable
enum Foo {
    A
    @differentiable
    func bar(x: Float64) {
        return x
    }
}


@differentiable
func f(x: Float64): Float64 {
    var p = stopGradient<Foo>(Foo.A.bar(1.0))
    return x * p.x
}


func main() {
    var x = 2.0
    var dx = grad(f, x)
    if (dx >= 1.000001 || dx <= 0.999999) {
        return 1
    }
    return 0
}

