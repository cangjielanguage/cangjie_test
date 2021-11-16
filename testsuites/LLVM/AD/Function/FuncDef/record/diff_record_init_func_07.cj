// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output  2>&1 | compare %f
// ASSERT: scan function A::init failed the differentiability check
record A {
    @differentiable
    A (){}
}

func main(): Int64 {
    return 0
}
