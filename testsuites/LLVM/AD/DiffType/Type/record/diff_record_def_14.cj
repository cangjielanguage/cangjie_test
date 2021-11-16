// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output 

@differentiable
record Point{
    var x : Float32
}

appead Point with Differentiable{
    func TagentZero(): Point{
        return Point(x:0.0)
    }
    func TagentAdd(): Point{
        return Point(x:0.0)
    }
    func TagentApply(): Point{
        return Point(x:0.0)     
    }
}

@differentiable
func foo(x: Point){
    return x
}

func main():Int64{
    print("test\n")
	return 0
}