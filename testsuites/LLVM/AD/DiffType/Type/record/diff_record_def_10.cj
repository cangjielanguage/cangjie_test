// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output 

interface ToString {
    func toString() : String
}

@differentiable
record Point <: ToString{
    let x : Float32
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