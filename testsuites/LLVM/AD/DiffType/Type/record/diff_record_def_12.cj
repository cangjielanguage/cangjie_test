// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output 

@differentiable
record Point{
    var x : Float32
}

@differentiable
record Point1{
    var x : Float32 * Point
}

@differentiable
func foo(x: Point1){
    return x
}

func main():Int64{
	return 0
}