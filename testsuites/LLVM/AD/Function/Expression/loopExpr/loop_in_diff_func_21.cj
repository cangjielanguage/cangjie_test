// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable
func f(x: Float64): Float64{
    @differentiable
    func g(y: Float64) {
        while (true){}
    }
    return x
}

func main(){
    return 0
}