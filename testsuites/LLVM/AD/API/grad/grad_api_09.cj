// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable
func goo(x:Float64){
    return x * x
}


func foo(x:Float64){
    var a = 1.0
    return grad(goo, x) // EXCEPTED: regex grad expr must be used in var decl with an identifier
}

func main(){
    let a = foo(1.0)
    print(a.toString())
    return 0
}