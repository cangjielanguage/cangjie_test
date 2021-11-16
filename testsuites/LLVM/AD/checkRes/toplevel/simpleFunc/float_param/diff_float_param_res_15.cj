// EXEC:%compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


@differentiable
func foo(x:Float64){
    var temp = x
    while (stopGradient<Float64>(temp) < 30.0){
        while(stopGradient<Float64>(temp) > 10.0) {
            temp = temp / 5.0
        }
        temp = temp * 6.0
    }
    return temp

}

func main(){
    let res1 = grad(foo, 1.0)
    if (res1 >= 36.000001 || res1 <= 35.999999){
        return 1
    }

    let res2 = valWithGrad(foo, 4.0)
    if (res2[0] >= 34.560001 || res2[0] <= 34.559999){
        return 1
    }
    if (res2[1] >= 8.640001 || res2[1] <= 8.639999){
        return 1
    }

    let adj = adjointOf(foo)
    let (v, bp) = adj(4.0)
    let res3 = bp(1.0)

    if (v >= 34.560001 || v <= 34.559999){
        return 1
    }
    if (res3 >= 8.640001 || res3 <= 8.639999){
        return 1
    }
    return 0
}