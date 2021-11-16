// EXEC:%compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable
func foo(x:Float64){
    var temp = x
    do {
        if (stopGradient<Float64>(x) > 2.0){
            temp = temp / x
        } else{
            temp = temp * 2.0 * x
        }
    } while (stopGradient<Float64>(temp) < 5.0)
    return temp

}

func main(){
    let res1 = grad(foo, 1.0)
    if (res1 >= 32.000001 || res1 <= 31.999999){
        return 1
    }

    let res2 = valWithGrad(foo, 1.0)
    if (res2[0] >= 8.000001 || res2[0] <= 7.999999){
        return 1
    }
    if (res2[1] >= 32.000001 || res2[1] <= 31.999999){
        return 1
    }

    let adj = adjointOf(foo)
    let (v, bp) = adj(1.0)
    let res3 = bp(1.0)

    if (v >= 8.000001 || v <= 7.999999){
        return 1
    }
    if (res3 >= 32.000001 || res3 <= 31.999999){
        return 1
    }
    return 0
}