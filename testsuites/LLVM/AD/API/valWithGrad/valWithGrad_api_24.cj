// EXEC-0: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC-0: %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex foo_res = 1.000000foo_grad = 2.000000
@differentiable 
func goo(x:Float64){
    return x 
}

@adjoint[primal:goo]
func foo(x:Float64){
    return (
        1.0,
        {x:Float64=>return 2.0*x}
    ) 
}


func main(){
    let valWithGrad_res = valWithGrad(goo, 2.0)
    let (foo_res, foo_grad) = valWithGrad_res
    print("foo_res = ")
    print(foo_res.toString())
    print("foo_grad = ")
    print(foo_grad.toString())
    return 0
}