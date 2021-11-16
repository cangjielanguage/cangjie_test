// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto function A::a failed the differentiability check

record A {
    @differentiable
    func a(){}
}

func main(): Int64 {
    return 0
}
