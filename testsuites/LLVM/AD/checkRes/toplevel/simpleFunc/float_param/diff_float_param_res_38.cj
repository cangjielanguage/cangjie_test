// EXEC:%compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable
func sub(x:Float64, y:Float64){
    return 2.0 * x - y
}
@adjoint[primal: sub]
func woo(x: Float64, y: Float64){
    return (
        32.0,
        {temp: Float64=>(temp, temp)}
    )
}

@differentiable
func foo(x:Float64, y:Float64){
    var temp = x
    while (stopGradient<Float64>(temp) < 30.0){
        temp = sub(x, y)
    }
    return temp
}

func main(){
    let res1 = grad(foo, (16.0, 1.0))
    if (res1[0] >= 1.000001 || res1[0] <= 0.999999){
        return 1
    }
    if (res1[1] >= 1.000001 || res1[1] <= 0.999999){
        return 1
    }

    let res2 = valWithGrad(foo, (16.0, 1.0))
    if (res2[0] >= 32.000001 || res2[0] <= 31.999999){
        return 1
    }
    if (res2[1][0] >= 1.000001 || res2[1][0] <= 0.999999){
        return 1
    }
    if (res2[1][1] >= 1.000001 || res2[1][1] <= 0.999999){
        return 1
    }

    let adj = adjointOf(foo)
    let (v, bp) = adj(16.0, 1.0)
    let res3 = bp(2.0)

    if (v >= 32.000001 || v <= 31.999999){
        return 1
    }
    if (res3[0] >= 2.000001 || res3[0] <= 1.999999){
        return 1
    }
    if (res3[1] >= 2.000001 || res3[1] <= 1.999999){
        return 1
    }
    return 0
}