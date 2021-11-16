// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable
func foo(x:Float64,y:Float64){
    return x + y
}

@differentiable
func goo(x:Float64, y:Float64){
    let valWithGrad_res = valWithGrad(foo,(x,y)) // EXPEXTED: regex unsupport valWithGrad expr in differentiable function
    return valWithGrad_res
}

func main(){
    let a = goo(1.0,2.0)
    return 0
}