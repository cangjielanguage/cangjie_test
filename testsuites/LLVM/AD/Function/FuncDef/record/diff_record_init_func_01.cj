// EXEC: %compiler %enableAD %cmp_opt %f -o %output

@differentiable
record A {
    @differentiable
    init(x:Float64){

    }
}

func main(): Int64 {
    return 0
}
