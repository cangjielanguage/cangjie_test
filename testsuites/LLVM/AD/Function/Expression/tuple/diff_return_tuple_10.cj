// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

record A{
    var temp : Float64 * Float64

    init(){
        temp = (2.0,2.0)
    }

    @differentiable[except:[this]]
    func foo(x: Float64*Float64) {
        var a = this.temp
        return (x[0] + a[0], x[1] + a[1])
    }
}


func main() {
    return 0
}