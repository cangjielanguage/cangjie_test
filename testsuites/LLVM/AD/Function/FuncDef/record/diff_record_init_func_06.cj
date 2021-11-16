// EXEC: %compiler %enableAD %cmp_opt %f -o %output

@differentiable
record A {
    @differentiable
    A (){}
}

func main(): Int64 {
    return 0
}
