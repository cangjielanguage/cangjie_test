// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
func foo(x: Float64, y:Float64) {
    
    return (x,y) 
}

@differentiable
func goo(x: Float64) {
    var (a,b) = foo(x, 1.0)
    if (stopGradient<Float64>(x) >= 0.0) {
        a = a * x
    } else {
        a = a * x
    }
    return x + a
}

func main() {
    return 0
}