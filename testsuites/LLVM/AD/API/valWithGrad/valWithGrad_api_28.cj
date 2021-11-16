// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
@differentiable
func goo(x:Float64, y:Float64){
    return x * y
}


func main(){
    let valWithGrad_res = valWithGrad(goo, (2.0,2.0))
    let (goo_res, goo_grad_x, goo_grad_y) = valWithGrad_res //EXPECTED: regex tuple pattern with correct size expected
    return 0
}