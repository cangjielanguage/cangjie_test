// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

interface B{
    @differentiable[except:[this]]
    func pow(x: Float64) {
        var r: Float64 = 1.0
        var temp = 4.0
        while (stopGradient<Float64>(temp) > 3.0) {
            r = r * x
            temp = temp - 1.0
        }
        return r
    }
}

class A <: B{
}

func main() {
    return 0
}