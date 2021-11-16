// EXEC: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable[stage:2]
func foo(x:Float64){
    var tp: Float32*Float64 = (1.0, 2.0)
    return tp
}

@differentiable
func grad_foo(x:Float64){
    var adj = adjointOf(foo)
    var (v, bp) = adj(x)
    return bp(v)
}

func valid(precision: Float64, x0: Float64, gradDx: Float64, diffFunc:(Float64)->Float64){
    var pass = 0.0
    var fail = 0.0
    for (i in 1..10) {
        var dx = 1.0 / Float64(10 ** i)
        var x1 = x0 + dx
        var df = diffFunc(x1) - diffFunc(x0)
        var numericalDx = df / dx
        var diffValue = gradDx - numericalDx
        if (diffValue < 0.0) {
            diffValue = numericalDx - gradDx
        }

        if (diffValue > 0.01) {
            fail = fail + 1.0
        } else {
            pass = pass + 1.0
        }
    }

    let percent_pass = pass/(fail+pass)
    if (percent_pass > 0.6) {
        return true
    }
    return false
}

func main() {
    let v = 1.0
    let dxdx = grad(grad_foo, v)
    if (valid(1e-4, v, dxdx, grad_foo)){
        return 0
    }
    return 1
}