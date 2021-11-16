// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output 

@differentiable
func foo(x: Float16 * Unit){
    return x
}

func main(){
	return 0
}