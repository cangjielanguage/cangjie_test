// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output  

@differentiable
func foo(x: Float32){
    x
}

func main(){
	return 0
}