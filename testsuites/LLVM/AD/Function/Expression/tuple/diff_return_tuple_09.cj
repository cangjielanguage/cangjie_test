// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

class A{
    var temp : Float64 * Float64

    init(){
        temp = (2.0,2.0)
    }

    @differentiable[except:[this]]
    func foo(x: Float64) {
        var a = this.temp
        return x + a[0]
    }
}


func main() {
    return 0
}