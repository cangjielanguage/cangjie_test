// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output 

@differentiable
func foo(x: Float64*Float16){
    return x
}

func main(){
	return 0
}