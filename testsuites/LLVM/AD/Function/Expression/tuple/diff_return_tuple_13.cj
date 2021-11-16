// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

open class B {
    var temp : Float64 * Float64

    init(){
        temp = (2.0,2.0)
    }
}
class A <: B {
    
    @differentiable[except:[this]]
    func foo(x: Float64*Float64) {
        var (a,b) = this.temp
        return (x[0] + a, x[1] + b)
    }
}


func main() {
    return 0
}