// EXEC-PIPE-1:%compiler %cmp_opt %enableAD %n.cj -o %n.out 2>&1 | compare %f

@differentiable
record A{
    var index: Float64
    @differentiable
    init(x:Float64){ // EXPECTED: regex multiple returns are not supported by AD yet
        
        var r: Float64 = 1.0
        var temp = 4.0
        while (stopGradient<Float64>(temp) > 3.0) {
            r = r * x
            temp = temp - 1.0
        }
        this.index = r
        return 
    }
}

func main() {
    return 0
}