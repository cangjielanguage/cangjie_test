// EXEC:%compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable
record A {
    var temp1: Float32
    var temp2: Float32
}

@differentiable
func foo(x:A){
    var count = x.temp2
    var res : Float32 = 1.0
    while (stopGradient<Float32>(count) < 5.0){
        if (stopGradient<Float32>(count) < 3.0){
            res = res * x.temp1
            count = count + 1.0
        }
        else{
            res = 2.0 * res * x.temp1
            count = count + 1.0
        }
    }
    return res * x.temp2
}

func main(){
    var x = A(temp1:1.0, temp2:0.0)

    // use grad get value
    let res1 = grad(foo, x)
    if (res1.temp1 >= 0.000001 || res1.temp1 <= -0.000001){
        return 1
    }
    if (res1.temp2 >= 4.000001 || res1.temp2 <= 3.999999){
        return 1
    }

    // use valWithGrad get value
    let res2 = valWithGrad(foo, x)
    if (res2[0] >= 0.000001 || res2[0] <= -0.000001){
        return 1
    }
    if (res2[1].temp1 >= 0.000001 || res2[1].temp1 <= -0.000001){
        return 1
    }
    if (res2[1].temp2 >= 4.000001 || res2[1].temp2 <= 3.999999){
        return 1
    }

    // use adjointOf get value
    let adj = adjointOf(foo)
    let (v, bp) = adj(x)
    let res3 = bp(1.0)
    if (v >= 0.000001 || v <= -0.000001){
        return 1
    }
    if (res3.temp1 >= 0.000001 || res3.temp1 <= -0.000001){
        return 1
    }
    if (res3.temp2 >= 4.000001 || res3.temp2 <= 3.999999){
        return 1
    }
    return 0
}