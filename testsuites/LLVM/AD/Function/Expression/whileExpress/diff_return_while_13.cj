// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
record A{
    var index: Float64
    @differentiable
    init(x:Float64){
        
        var r: Float64 = 1.0
        var temp = 4.0
        while (stopGradient<Float64>(temp) > 3.0) {
            r = r * x
            temp = temp - 1.0
        }
        index = r
    }
}

func main() {
    return 0
}