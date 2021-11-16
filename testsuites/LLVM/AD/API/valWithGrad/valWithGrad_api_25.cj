// EXEC-0: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC-0: %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex foo_res = 2.000000foo_grad = true
@differentiable[except:[x]]
func goo(x:Float64){
    return x 
}


func main(){
    let valWithGrad_res = valWithGrad(goo, 2.0)
    let (foo_res, foo_grad) = valWithGrad_res
    print("foo_res = ")
    print(foo_res.toString())
    print("foo_grad = ")
    let res = foo_grad == ()
    print(res.toString())
    return 0
}