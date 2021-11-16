// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan user define is not supported

appead Unit with Differentiable{ 
    func TagentZero():Unit{
        return ()
    }
}
@differentiable
func foo(x: Unit){
    return x
}

func main():Int64{
    print("test\n")
	return 0
}