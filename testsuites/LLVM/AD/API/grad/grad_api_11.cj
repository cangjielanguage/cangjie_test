// EXEC-0: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC-0: %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan grad_1_out = 4.000000

@differentiable[except:[y]]
func goo(x:Float64, y:Float64){
    return x * x * y
}

func main(){
    let a = grad(goo, (1.0, 2.0))
    print("grad_1_out = ")
    print(a.toString())
    return 0
}