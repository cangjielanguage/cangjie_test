// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan function A::a failed the differentiability check

@differentiable
record A {
    @differentiable
    func a(y:Int64){}
}

func main(): Int64 {
    return 0
}
