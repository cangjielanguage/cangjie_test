// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

@differentiable
func f(x : Float64): Float64{
    return x * stopGradient<Float64>()      // EXPECT: regex missing argument for call with parameter list
}

func main(){
    var x= 1.0
    var dx = grad(f, x)
    if (dx >= 1.000001 || dx <= 0.999999){
        return 1
    }
    return 0
}
