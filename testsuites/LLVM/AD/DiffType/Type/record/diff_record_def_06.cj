// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output  

@differentiable
record Point{
    var x : Float16
}

@differentiable
record Point2{
    var y : Point
}

@differentiable
func foo(x: Point2){
    return x
}

func main():Int64{
    print("test\n")
	return 0
}