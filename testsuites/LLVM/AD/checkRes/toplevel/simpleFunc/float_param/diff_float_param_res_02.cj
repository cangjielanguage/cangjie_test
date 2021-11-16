// EXEC:%compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable
func foo(){
    return 1.0
}

func main(){
    let res1 = grad(foo, ())
    if (res1 != ()){
        return 1
    }

    let res2 = valWithGrad(foo, ())
    if (res2[0]>=1.000001 || res2[0] <= 0.999999){
        return 1
    }
    if (res2[1] != ()){
        return 1
    }

    let adj = adjointOf(foo)
    let (v, bp) = adj()
    let res3 = bp(1.0)
    if (v >=1.0000001 || v <= 0.9999999){
        return 1
    }
    if (res3 != ()){
        return 1
    }
    return 0
}