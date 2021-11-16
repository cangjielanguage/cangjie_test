// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output  

@differentiable
record Point{
    var x : Float32
    func toString() : String {
        return "this"
    }
}

@differentiable
func foo(x: Point){
    return x
}

func main():Int64{
	return 0
}