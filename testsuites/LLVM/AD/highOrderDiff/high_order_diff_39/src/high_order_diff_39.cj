// DEPENDENCE: ../src
// EXEC: %compiler %enableAD %cmp_opt -c src/pkg/pkg.cj -o pkg.%middle
// EXEC: %compiler %enableAD %cmp_opt %f pkg.%middle -o %output
// EXEC: %run %run_opt %run_args %output

@autodiff import pkg.foo

@differentiable
external func grad_foo(x:Float64){
    var adj = adjointOf(foo)
    var (v, bp) = adj(x)
    return bp(1.0)
}

func main() {
    let v = 1.0
    let dxdx = grad(grad_foo, v)
    if (dxdx >= 2.000001 || dxdx <= 1.999999){
        return 1
    }
    0
}
