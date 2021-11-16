// EXEC: %compiler %enableAD %cmp_opt %f -o %output

@differentiable
record A {
    var a : Float64
    @differentiable
    init(){
        a = 1.0
    }
}

func main(): Int64 {
    return 0
}
