// EXEC-0: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC-0: %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan foo_res = 2.000000foo_grad_1 = 4.000000foo_grad_2 = 1.000000

@differentiable
func goo(x:Float64, y:Float64){
    return x * x * y
}

func main(){
    let valWithGrad_res = valWithGrad(goo, (1.0, 2.0))
    let (foo_res, foo_grad) = valWithGrad_res
    print("foo_res = ")
    print(foo_res.toString())
    print("foo_grad_1 = ")
    print(foo_grad[0].toString())
    print("foo_grad_2 = ")
    print(foo_grad[1].toString())
    return 0
}