// EXEC:%compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable
func foo(x:Float64){
    var temp = x
    return if(stopGradient<Float64>(temp) < 5.0){
        x + x
    } 
    else{
        x - x
    }
}

func main(){
    let res1 = grad(foo, 1.0)
    if (res1 >= 2.000001 || res1 <= 1.999999){
        return 1
    }

    let res2 = valWithGrad(foo, 1.0)
    if (res2[0] >= 2.000001 || res2[0] <= 1.999999){
        return 1
    }
    if (res2[1] >= 2.000001 || res2[1] <= 1.999999){
        return 1
    }

    let adj = adjointOf(foo)
    let (v, bp) = adj(1.0)
    let res3 = bp(1.0)

    if (v >= 2.000001 || v <= 1.999999){
        return 1
    }
    if (res3 >= 2.000001 || res3 <= 1.999999){
        return 1
    }
    return 0
}