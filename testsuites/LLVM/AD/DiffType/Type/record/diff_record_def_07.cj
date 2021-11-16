// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output  

@differentiable
record Point{
    var x : Unit
}

@differentiable
func foo(x: Point){
    return x
}

func main():Int64{
    print("test\n")
	return 0
}