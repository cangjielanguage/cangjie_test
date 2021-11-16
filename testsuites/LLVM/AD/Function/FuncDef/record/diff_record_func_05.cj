// EXEC: %compiler %enableAD %cmp_opt %f -o %output

@differentiable
record A {
    
    func a(y:Int64){}

    @differentiable
    func a(x:Float64){}
}

func main(): Int64 {
    return 0
}
