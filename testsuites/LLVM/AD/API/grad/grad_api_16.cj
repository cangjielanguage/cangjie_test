// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable
func foo(x:Float64,y:Float64){
    return x + y
}

@differentiable
func goo(x:Float64, y:Float64){
    let temp = grad(foo,(x,y)) // EXPEXTED: regex unsupport grad expr in differentiable function
    return temp
}

func main(){
    let a = goo(1.0,2.0)
    return 0
}