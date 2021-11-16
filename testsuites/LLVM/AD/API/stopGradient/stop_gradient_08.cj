// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable [except:[y]]
func f(x: Float64, y:Char): Float64 {
    stopGradient<Char>(y)
    return x * x
}

func main(){
    var x = 2.0
    var dx = grad(f, (x,'a'))
    if (dx >= 4.000001 || dx <= 3.999999){
        return 1
    }
    return 0
}

