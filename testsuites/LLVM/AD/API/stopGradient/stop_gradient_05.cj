// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan parameters and arguments mismatch

@differentiable
func f(x : Float64): Float64 {
    return stopGradient<Int64>(x)
}

func main(){
    var x = 2.0
    var dx = grad(f, x)
    if (dx != 0.0 ){
        return 1
    }
    return 0
}
