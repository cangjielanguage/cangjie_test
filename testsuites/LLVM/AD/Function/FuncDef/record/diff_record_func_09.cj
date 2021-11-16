// EXEC: %compiler %enableAD %cmp_opt %f -o %output

record A {
    
    var x : Int64
    var y : Float64

    @differentiable[except:[this]]
    mut func a(x:Float64){
        return this.y + x
    }
}

func main(): Int64 {
    return 0
}
