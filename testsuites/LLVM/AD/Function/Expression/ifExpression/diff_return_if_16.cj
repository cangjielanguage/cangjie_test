// EXEC-PIPE-1:%compiler %cmp_opt %enableAD %n.cj -o %n.out 2>&1 | compare %f

@differentiable
func foo(x: Float64) {
    var a = if (stopGradient<Float64>(x) >= 0.0) {
        func f(){ // EXPECTED: regex multiple returns are not supported by AD yet
            if (stopGradient<Float64>(x) >= 0.0){
                return x
            } else {
                return -x
            }
        }
        f
    } else {
        func g(){
            if (stopGradient<Float64>(x) >= 0.0){
                return x
            } else {
                return -x
            }
        }
        g
    }
    return a
}

func main() {
    return 0
}