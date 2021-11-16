// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

interface B{}

class A <: B{
    var index: Float64
    init(a:Float64){
        this.index = a
    }
    @differentiable[except:[this]]
    func pow(x: Float64, y: Float64) {
        var r: Float64 = 1.0
        var temp = y
        while (stopGradient<Float64>(temp) > 3.0) {
            r = r * x
            temp = temp - 1.0
        }
        return r
    }
}

func main() {
    return 0
}