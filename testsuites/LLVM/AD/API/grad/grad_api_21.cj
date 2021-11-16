// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


@differentiable
record A{
    @differentiable
    func goo(x:Float64, y:Float64){
        return x + y
    }
}

func main(){
    let a = A()
    var res = grad(a.goo, (2.0,2.0)) // EXPECTED: regex the function is not a top-level differentiable function identifier
    return 0
}