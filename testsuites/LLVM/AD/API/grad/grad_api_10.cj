// EXEC-0: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC-0: %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan grad_1_out = 4.000000grad_2_out = 1.000000

@differentiable
func goo(x:Float64, y:Float64){
    return x * x * y
}

func main(){
    let a = grad(goo, (1.0, 2.0))
    print("grad_1_out = ")
    print(a[0].toString())
    print("grad_2_out = ")
    print(a[1].toString())
    return 0
}