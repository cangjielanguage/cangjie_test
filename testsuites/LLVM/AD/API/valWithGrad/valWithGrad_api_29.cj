// EXEC-0: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC-0: %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex goo_res = 4.000000goo_grad_x = 2.000000goo_grad_y = 2.000000
@differentiable
func goo(x:Float64, y:Float64){
    return x * y
}


func main(){
    let valWithGrad_res = valWithGrad(goo, (2.0,2.0))
    let (goo_res, (goo_grad_x,goo_grad_y)) = valWithGrad_res
    print("goo_res = ")
    print(goo_res.toString())
    print("goo_grad_x = ")
    print(goo_grad_x.toString())
    print("goo_grad_y = ")
    print(goo_grad_y.toString())
    return 0
}