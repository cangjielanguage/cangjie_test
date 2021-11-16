// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable
func bar(x:Float64) {
    return x
}


@differentiable [except: [y]]
func f(x: Float64, y: String): Float64 {
    while (bar(stopGradient<Float64>(x)) > stopGradient<Float64>(x)) {
        bar(x)
    }
    return x
}

func main(){
    var x =grad(f, (2.0, "hi"))
    if (x == 1.0) {
        return 0
    }
    return 1
}