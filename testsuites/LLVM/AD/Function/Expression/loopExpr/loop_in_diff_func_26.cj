// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable
record Point {
    let x: Float64
    @differentiable
    init(x1: Float64) {
        x = x1
        while (true){}
    }
}

func main(){
    return 0
}