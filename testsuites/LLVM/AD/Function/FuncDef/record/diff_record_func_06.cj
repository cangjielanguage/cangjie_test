// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex function A::a failed the differentiability check

@differentiable[except:[x]]
record A {
    
    var x : Int64
    var y : Float64

    @differentiable
    func a(x:Float64){
        return this.x
    }
}

func main(): Int64 {
    return 0
}
