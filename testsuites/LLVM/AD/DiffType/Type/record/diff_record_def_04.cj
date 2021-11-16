// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan variable x has non-differentiable type Int32 but it does not appear in an except list

@differentiable
record Point{
    var x : Int32
}

@differentiable
func foo(x: Point){
    return x
}

func main():Int64{
	return 0
}