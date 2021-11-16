// EXEC-PIPE-1:%compiler %cmp_opt %enableAD %n.cj -o %n.out 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex xxx not define

@differentiable[except:[temp2]]
record A {
    var temp1: Float32
    var temp2: Int32
}

@differentiable
func foo(x:A){
    var count = 1.0
    var res : Float32 = 1.0
    while (stopGradient<Float64>(count) < 5.0){
        if (stopGradient<Float64>(count) < 3.0){
            res = res * x.temp1
            count = count + 1.0
        }
        else{
            res = 2.0 * res * x.temp1
            count = count + 1.0
        }
    }
    return res
}

func main(){
    var x = A(temp1:1.0, temp2:0)

    // use grad get value
    let res1 = grad(foo, x)
    print(" grad1_temp1 = ")
    print(res1.temp1.toString())
    print(" grad1_temp2 = ")
    print(res1.temp2.toString())

    // use valWithGrad get value
    let res2 = valWithGrad(foo, x)
    print(" res2_forward = ")
    print(res2[0].toString())
    print(" res2_grad_temp1 = ")
    print(res2[1].temp1.toString())
    print(" res2_grad_temp2 = ")
    print(res2[1].temp2.toString())

    // use adjointOf get value
    let adj = adjointOf(foo)
    let (v, bp) = adj(x)
    let res3 = bp(1.0)
    print(" res3_forward = ")
    print(v.toString())
    print(" res3_grad_temp1 = ")
    print(res3.temp1.toString())
    print(" res3_grad_temp2 = ")
    print(res3.temp2.toString())
    return 0
}
