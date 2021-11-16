// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex user define is not supported

extend Float64 <: Differentiable{ 
    func TangentZero(): Float64{
        return 2.0
    }
    func TangentAdd(x: Float64, y: Float64): Float64 {
        return x + y
    }
    func TangentApple(dx: Float64): Float64{
        return this + dx
    }
}

@differentiable
func foo(x: Float64){
    x
}

func main(){
	return 0
}