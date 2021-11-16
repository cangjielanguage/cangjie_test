// EXEC:%compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable
func sub(x:Float64){
    return 2.0 * x - 1.0
}

@adjoint[primal: sub]
func goo(x:Float64) {
    return (
        x,
        {temp: Float64 => temp}
    )
}

@differentiable
func foo(x:Float64){
    var temp = x
    do {
        if (stopGradient<Float64>(x) > 10.0){
            temp = sub(temp) + 31.0
        }
        else{
            temp = sub(temp) + 6.0
        }
    } while (stopGradient<Float64>(temp) < 30.0)
    return temp
}

func main(){
    let res1 = grad(foo, 1.0)
    if (res1 >= 1.000001 || res1 <= 0.999999){
        return 1
    }
    let res2 = valWithGrad(foo, 1.0)
    if (res2[0] >= 31.000001 || res2[0] <= 30.999999){
        return 1
    }
    if (res2[1] >= 1.000001 || res2[1] <= 0.999999){
        return 1
    }

    let adj = adjointOf(foo)
    let (v, bp) = adj(15.0)
    let res3 = bp(3.0)

    if (v >= 46.000001 || v <= 45.999999){
        return 1
    }
    if (res3 >= 3.000001 || res3 <= 2.999999){
        return 1
    }

    return 0
}