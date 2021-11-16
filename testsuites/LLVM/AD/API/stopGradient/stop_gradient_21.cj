// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable[stage:2]
func foo(x:Float64){
    return x
}

@adjoint [primal: foo]
func adjoint_init(x: Float64)
{
    (x*x, {sens: Float64 => x * stopGradient<Float64>(sens + 2.0)})
}

func main() {
    let v = 2.0
    let dx = grad(foo, v)
    if (dx >= 6.000001 || dx <= 5.999999){
        return 1
    }
    return 0
}