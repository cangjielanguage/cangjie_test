// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
func goo(x: Float64, y:Float64) {
    
    return (x,y) 
}

@differentiable
func foo(x: Float64, y:Float64) {
    var (a,b) = goo(x,y)
    while (stopGradient<Float64>(b) >= 0.0) {
        a = a * x
        b = b + 1.0
    } 
    return x + a
}

func main() {
    return 0
}