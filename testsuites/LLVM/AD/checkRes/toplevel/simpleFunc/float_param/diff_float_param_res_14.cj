// EXEC:%compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args



@differentiable
func foo(x:Float64){
    var temp = x
    if (stopGradient<Float64>(x) < 5.0){
        do {
            temp = temp * 7.0
        }while (stopGradient<Float64>(temp) < 5.0)
    } else {
         do {
            temp = temp * 5.0
        } while (stopGradient<Float64>(temp) < 10.0)
    }
    return temp

}

func main(){
    let res1 = grad(foo, 1.0)
    if (res1 >= 7.000001 || res1 <= 6.999999){
        return 1
    }

    let res2 = valWithGrad(foo, 6.0)
    if (res2[0] >= 30.000001 || res2[0] <= 29.999999){
        return 1
    }
    if (res2[1] >= 5.000001 || res2[1] <= 4.999999){
        return 1
    }

    let adj = adjointOf(foo)
    let (v, bp) = adj(6.0)
    let res3 = bp(1.0)

    if (v >= 30.000001 || v <= 29.999999){
        return 1
    }
    if (res3 >= 5.000001 || res3 <= 4.999999){
        return 1
    }
    return 0
}