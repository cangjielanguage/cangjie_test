// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output


@differentiable
func f(x:Float64) {
    var tp: Float64*Unit = (3.0, while(false){})
    return tp[1]
}

func main(){
    return 0
}