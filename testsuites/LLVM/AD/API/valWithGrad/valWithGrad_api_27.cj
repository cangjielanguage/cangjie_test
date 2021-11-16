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
    let res = valWithGrad(goo, (2.0,2.0))
    print("goo_res = ")
    print(res[0].toString())
    print("goo_grad_x = ")
    print(res[1][0].toString())
    print("goo_grad_y = ")
    print(res[1][1].toString())
    return 0
}