// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable
func f(x: Float64, y: Float64): Float64{
    while (x > 0.1){
        if (true) { x+y }
        if (true) { x+y } else { x-y }
        if (true) { x+y } else if (true){ x-y } else { x*y }
    }
    return x
}

func main(){
    return 0
}