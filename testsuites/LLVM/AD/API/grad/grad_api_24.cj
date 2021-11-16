// EXEC-0: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC-0: %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex gradout = 2.000000
@differentiable 
func goo(x:Float64){
    return x 
}

@adjoint[primal:goo]
func foo(x:Float64){
    return (
        1.0,
        {x:Float64=>return 2.0*x}
    ) 
}


func main(){
    let a = grad(goo, 2.0)
    print("gradout = ")
    print(a.toString())
    return 0
}