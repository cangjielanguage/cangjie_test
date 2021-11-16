// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@differentiable
func sub(x:Float64, y:Float64){
    return 2.0 * x - y
}
@adjoint[primal: sub]
func sub_adjoint(x: Float64, y: Float64){
    return (
        32.0,
        {temp: Float64=>(temp, temp)}
    )
}

@differentiable
func add(x:Float64, y:Float64){
    return 2.0 * x + y
}

@adjoint[primal: add]
func add_adjoint(x: Float64, y: Float64){
    return (
        32.0,
        {temp: Float64=>(temp, temp)}
    )
}

@differentiable[except:[z]]
func foo(x:Float64, z: String, y !: Float64 = 1.0){
    var temp = x
    while (stopGradient<Float64>(temp) < 30.0){
        if (stopGradient<Float64>(temp) < 0.0){
            temp = sub(x, y)
        }
        else{
            temp = add(x, y)
        }
    }
    return temp
}

func main(){
    let res1 = grad(foo, (16.0, "test")) // EXPECTED: regex-auto the arguments is not matched for the differentiable function 'foo'

    print(" grad1_x = ")
    print(res1[0].toString())
    print(" grad1_y = ")
    print(res1[1].toString())

    let res2 = valWithGrad(foo, (16.0, "test"))
    print(" res2_forward = ")
    print(res2[0].toString())
    print(" res2_grad_x = ")
    print(res2[1][0].toString())
    print(" res2_grad_y = ")
    print(res2[1][1].toString())

    let adj = adjointOf(foo)
    let (v, bp) = adj(16.0, "test")
    let res3 = bp(2.0)
    print(" res3_forward = ")
    print(v.toString())
    print(" res3_grad_x = ")
    print(res3[0].toString())
    print(" res3_grad_y = ")
    print(res3[1].toString())
    return 0
}