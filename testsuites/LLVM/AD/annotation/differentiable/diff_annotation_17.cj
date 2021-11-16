// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output

@differentiable
func foo(y: Float32){
    return y
}

func main(){
    return 0
}