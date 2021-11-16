// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
func foo(x: Float64) {
    var a = if (stopGradient<Float64>(x) >= 0.0) {
        func f(){
            return x
        }
        f()
    } else {
        func g(){
            return -x
        }
        g()
    }
    return a
}

func main() {
    return 0
}