// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output  

@differentiable
record Point{
    var x : Float64 * Float64
}

@differentiable
func foo(x: Point){
    return x
}

func main(){
	return 0
}