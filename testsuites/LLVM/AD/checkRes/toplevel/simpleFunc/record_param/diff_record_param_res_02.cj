// EXEC:%compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable
record A {
    var temp: Float32

}

@differentiable
func foo(x:A){
    return x.temp+x.temp
}

func main(){
    var x = A(temp:1.0)

    // use grad get value
    let res1 = grad(foo, x)
    if (res1.temp >= 2.000001 || res1.temp <= 1.999999){
        return 1
    }

    // use valWithGrad get value
    let res2 = valWithGrad(foo, x)
    if (res2[0] >= 2.000001 || res2[0] <= 1.999999){
        return 1
    }
    if (res2[1].temp >= 2.000001 || res2[1].temp <= 1.999999){
        return 1
    }

    // use adjointOf get value
    let adj = adjointOf(foo)
    let (v, bp) = adj(x)
    let res3 = bp(1.0)
    if (v >= 2.000001 || v <= 1.999999){
        return 1
    }
    if (res3.temp >= 2.000001 || res3.temp <= 1.999999){
        return 1
    }
    return 0
}