// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan extra argument given for call with parameter list

@differentiable
func f(x : Float64): Float64{
    return stopGradient<Float64>(x,x)
}

func main(){
    var x = 2.0
    var dx = grad(f, x)
    if (dx != 0.0 ){
        return 1
    }
    return 0
}
