// EXEC:%compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable
func sub(x:Float64){
    return 2.0 * x - 1.0
}

@differentiable
func foo(x:Float64){
    var temp = x
    while (stopGradient<Float64>(temp) < 30.0){
        if (stopGradient<Float64>(temp) > 10.0) {
            temp = sub(temp)
        }
        temp = temp + 6.0
    }
    return temp
}

func main(){
    let res1 = grad(foo, 1.0)
    if (res1 >= 2.000001 || res1 <= 1.999999){
        return 1
    }
    let res2 = valWithGrad(foo, 15.0)
    if (res2[0] >= 35.000001 || res2[0] <= 34.999999){
        return 1
    }
    if (res2[1] >= 2.000001 || res2[1] <= 1.999999){
        return 1
    }

    let adj = adjointOf(foo)
    let (v, bp) = adj(15.0)
    let res3 = bp(1.0)

    if (v >= 35.000001 || v <= 34.999999){
        return 1
    }
    if (res3 >= 2.000001 || res3 <= 1.999999){
        return 1
    }
    return 0
}