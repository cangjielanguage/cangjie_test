// EXEC: %compiler %enableAD %cmp_opt %f -o %output

@differentiable
record A {
    @differentiable
    private func a(){}
}

func main(): Int64 {
    return 0
}
