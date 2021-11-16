// EXEC-0: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC-0: %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex gradout = true
@differentiable[except:[x]]
func goo(x:Float64){
    return x 
}


func main(){
    let a = grad(goo, 2.0)
    print("gradout = ")
    let res = a == ()
    print(res.toString())
    return 0
}