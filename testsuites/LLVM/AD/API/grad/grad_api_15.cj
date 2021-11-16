// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable
func goo(x:Float64, y:Float64){
    return (x,y)
}

func main(){
    let a = grad(goo, (1.0,2.0)) // EXPECTED: regex-auto the return type of function 'goo' is not float
    return 0
}