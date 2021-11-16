// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
@differentiable
func goo(x:Float64){
    return x
}


func main(){
    var (goo_res, goo_grad_x) = valWithGrad(goo, 2.0) // EXPECTED: regex valWithGrad expr must be used in var decl with an identifier
    print("goo_res = ")
    print(goo_res.toString())
    print("goo_grad_x = ")
    print(goo_grad_x.toString())
    return 0
}