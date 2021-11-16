// EXEC-0: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC-0: %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan foo_res = 1.000000foo_grad = 1.000000

@differentiable
func foo(x:Float64){
    return x
}

func main(){
    let a : Float64 = 1.0
    var valWithGrad_res = valWithGrad(foo,a)
    let (foo_res, foo_grad) = valWithGrad_res
    print("foo_res = ")
    print(foo_res.toString())
    print("foo_grad = ")
    print(foo_grad.toString())
    return 0
}