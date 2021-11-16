// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output  

@differentiable
func foo(x: Unit){
    return x
}

func main():Int64{
	return 0
}