// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan variable z has non-differentiable type Point but it does not appear in an except list


record Point{
    var x : Float32
}

@differentiable
record Point2{
    var z : Point
    var y : Float32
}

@differentiable
func foo(x: Point2){
    return x
}

func main():Int64{
    print("test\n")
	return 0
}