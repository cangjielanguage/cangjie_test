// EXEC: %compiler %enableAD %cmp_opt %f -o %output

@differentiable[except:[a]]
record A {
    var a : Int64
    @differentiable[except:[x]]
    init(x:Int64){
        a = 1
    }

    @differentiable
    init(y:Float64){
        a = 1
    }
}

func main(): Int64 {
    return 0
}
