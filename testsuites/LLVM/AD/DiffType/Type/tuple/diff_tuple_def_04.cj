// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output 

@differentiable
func foo(x: Float16*Float16){
    return x[0]
}

func main(){
	return 0
}