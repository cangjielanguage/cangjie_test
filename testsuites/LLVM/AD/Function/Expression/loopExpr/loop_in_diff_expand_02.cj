// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output


@differentiable
func f(x!: Unit = while(false){}) {
    return x
}

func main(){
    return 0
}