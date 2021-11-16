// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex variable x has non-differentiable type Int64 but it does not appear in an except list

@differentiable
record A {
    
    var x : Int64
    var y : Float64

    @differentiable[except:[this]]
    func a(x:Float64){
        return x
    }
}

func main(): Int64 {
    return 0
}
