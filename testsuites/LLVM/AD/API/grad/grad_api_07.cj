// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable
func foo(x:Float64){
    return x
}

func main(){
    let a = 1.0
    if (grad(foo,a) > 1.0){ // EXPECTED: regex grad expr must be used in var decl with an identifier
        print("true")
    } else{
        print("false")
    }
    return 0
}