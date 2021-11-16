// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output 

@differentiable
record Point{}

@differentiable
func foo(x: Point){
    return x
}

func main():Int64{
	return 0
}