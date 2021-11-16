// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable 
record A{
    var x : Float64
    init(){
        x=1.0
    }
}

@differentiable
func goo(x:A){
    return x
}

func main(){
    let x = A()
    let a = grad(goo, x) // EXPECTED: regex-auto the return type of function 'goo' is not float
    return 0
}