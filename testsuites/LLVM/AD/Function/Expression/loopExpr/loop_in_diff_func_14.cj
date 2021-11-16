// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable
func f(x : Float64): Float64{
    while (x > 0.1){
        g(x)
    }
    return g(x)
}

@differentiable
func g(x : Float64): Float64{
    return x
}

func main(){
    return 0
}