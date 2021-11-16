// EXEC:%compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable
func foo(x:Float64){
    var temp = x
    do {
        temp = temp + x
    } while (stopGradient<Float64>(temp) < 5.0)
    return temp

}

func main(){
    let res1 = grad(foo, 1.0)
    if (res1 >= 5.000001 || res1 <= 4.999999){
        return 1
    }

    let res2 = valWithGrad(foo, 1.0)
    if (res2[0] >= 5.000001 || res2[0] <= 4.999999){
        return 1
    }
    if (res2[1] >= 5.000001 || res2[1] <= 4.999999){
        return 1
    }

    let adj = adjointOf(foo)
    let (v, bp) = adj(1.0)
    let res3 = bp(1.0)

    if (v >= 5.000001 || v <= 4.999999){
        return 1
    }
    if (res3 >= 5.000001 || res3 <= 4.999999){
        return 1
    }
    return 0
}