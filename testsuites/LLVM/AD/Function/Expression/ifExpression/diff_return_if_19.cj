// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

record A{
    var index: Float64
    init(x:Float64){
        this.index = x
    }
    @differentiable[except:[this]]
    func pow(x: Float64) {
        var r: Float64 = 1.0
        var temp = this.index
        if (temp > 3.0) {
            r = r * x
            temp = temp - 1.0
        }
        return r
    }
}

func main() {
    return 0
}