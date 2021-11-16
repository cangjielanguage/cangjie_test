// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
func foo(x: Float64) {
    if (stopGradient<Float64>(x) >= 0.0) {
        2.0 * x
    } else {
        3.0 * x
    }
}

func main() {
    return 0
}