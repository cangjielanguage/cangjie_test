// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable
func f(x : Float64): Float64{
    while (x > 0.1){
        var z: Float64*Float32 = (0.1, 0.3)
    }
    return x
}

func main(){
    return 0
}