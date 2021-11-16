// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

extend Float16*Int16 <: Differentiable{ // EXPECTED: regex expected an interface here
    func TangentZero(): Float16*Int16{
        return (2.0, 1)
    }
}

@differentiable
func foo(x: Float16*Int16){
    return x
}

func main(){
	return 0
}