// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable
func f(x : Float64): Float64{
    do {
        do {} while (x > 0.1)
    } while (x > 0.1)
    return x
}

func main(){
    return 0
}