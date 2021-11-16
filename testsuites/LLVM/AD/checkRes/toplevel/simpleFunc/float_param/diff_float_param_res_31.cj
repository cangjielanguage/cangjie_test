// EXEC:%compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable
func sub(x:Float64, y:Float64){
    return 2.0 * x - y
}

@differentiable
func add(x:Float64, y:Float64){
    return 2.0 * x + y
}

@differentiable
func foo(x:Float64, y:Float64){
    var temp = x
    while (stopGradient<Float64>(temp) < 30.0){
        if (stopGradient<Float64>(x) < 0.0){
            temp = sub(x, y)
        }
        else{
            temp = add(x, y)
        }

    }
    return temp
}

func main(){
    let res1 = grad(foo, (16.0, 1.0))
    if (res1[0] >= 2.000001 || res1[0] <= 1.999999){
        return 1
    }
    if (res1[1] >= 1.000001 || res1[1] <= 0.999999){
        return 1
    }

    let res2 = valWithGrad(foo, (16.0, 1.0))
    if (res2[0] >= 33.000001 || res2[0] <= 32.999999){
        return 1
    }
    if (res2[1][0] >= 2.000001 || res2[1][0] <= 1.999999){
        return 1
    }
    if (res2[1][1] >= 1.000001 || res2[1][1] <= 0.999999){
        return 1
    }

    let adj = adjointOf(foo)
    let (v, bp) = adj(16.0, 1.0)
    let res3 = bp(1.0)

    if (v >= 33.000001 || v <= 32.999999){
        return 1
    }
    if (res3[0] >= 2.000001 || res3[0] <= 1.999999){
        return 1
    }
    if (res3[1] >= 1.000001 || res3[1] <= 0.999999){
        return 1
    }
    return 0
}