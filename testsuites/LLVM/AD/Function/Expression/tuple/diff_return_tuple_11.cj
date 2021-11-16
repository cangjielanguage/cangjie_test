// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

interface B {
    func foo(x: Float64*Float64) : Float64*Float64
}
record A <: B {

    @differentiable[except:[this]]
    func foo(x: Float64*Float64) {
        var a = x
        return (x[0] + a[0], x[1] + a[1])
    }
}

func main() {
    return 0
}