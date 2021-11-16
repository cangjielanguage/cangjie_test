// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


@differentiable
func foo(x:Float64){
    return x
}

func main(){
    let a : Float64 = 1.0
    let valWithGrad_res : Float64 * Float64 = valWithGrad(a,foo) // EXCEPTED: regex the function is not a top-level differentiable function identifier
    let (foo_res, foo_grad) = valWithGrad_res
    return 0
}