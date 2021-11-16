// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable
func foo(x:Float32){
    return x
}

func main(){
    let a : Float64 = 1.0
    var valWithGrad_res = valWithGrad(foo,a)  // EXCEPTED: regex-auto the arguments is not matched for the differentiable function 'foo'
    let (foo_res, foo_grad) = valWithGrad_res
    return 0
}