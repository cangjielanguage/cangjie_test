// EXEC-0: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC-0: %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex goo_res = 2.000000goo_grad = 1.000000
@differentiable
func goo(x:Float64){
    return x 
}


func main(){
    let res = valWithGrad(goo, 2.0)
    print("goo_res = ")
    print(res[0].toString())
    print("goo_grad = ")
    print(res[1].toString())
    return 0
}