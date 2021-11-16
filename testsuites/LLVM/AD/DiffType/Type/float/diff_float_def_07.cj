// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output 

@differentiable
func foo(x: Float64){
    x
}

func main(){
	return 0
}