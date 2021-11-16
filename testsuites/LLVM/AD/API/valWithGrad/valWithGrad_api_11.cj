// EXEC-0: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC-0: %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan foo_res = 2.000000foo_grad = 4.000000

@differentiable[except:[y]]
func goo(x:Float64, y:Float64){
    return x * x * y
}

func main(){
    let valWithGrad_res = valWithGrad(goo, (1.0, 2.0))
    let (foo_res, foo_grad) = valWithGrad_res
    print("foo_res = ")
    print(foo_res.toString())
    print("foo_grad = ")
    print(foo_grad.toString())
    return 0
}