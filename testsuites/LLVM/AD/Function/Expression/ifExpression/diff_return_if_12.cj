// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
func foo(x: Float64) {
    if (stopGradient<Float64>(x) >= 0.0) {
        {=>return x}
    } else {
        {=>return -x}
    }
}

func main() {
    return 0
}