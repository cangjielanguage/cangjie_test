// EXEC-PIPE-1: %compiler %cmp_opt %enableAD %n.cj -o %n.out 2>&1 | compare %f
// ASSERT: regex function A::pow failed the differentiability check

class A{
    var index: Int64
    init(a:Int64){
        this.index = a
    }
    @differentiable[except:[this]]
    func pow(x: Float64) {
        var r: Float64 = 1.0
        var temp = this.index
        while (this.index > 3) {
            r = r * x
            temp = temp - 1
        }
        return r
    }
}

func main() {
    return 0
}