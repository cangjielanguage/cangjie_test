// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
record A {
    var temp : Float64 * Float64

    init(){
        temp = (2.0,2.0)
    }
}

extend A {
    
    @differentiable
    func foo(x: Float64*Float64) {
        var (a,b) = temp
        return (x[0] + a, x[1] + b)
    }
}


func main() {
    return 0
}