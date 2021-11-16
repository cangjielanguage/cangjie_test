// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable[except:[y]]
func f(x: Float64, y:Int64): Float64 {
    stopGradient<Int64>(y)
    return x
}

func main(){
    var x = 2.0
    var dx = grad(f, (x, 4))
    if (dx >= 1.000001 || dx <= 0.999999){
        return 1
    }
    return 0
}