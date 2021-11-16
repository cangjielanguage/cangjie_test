// EXEC-PIPE-1: %compiler %cmp_opt %enableAD %n.cj -o %n.out 2>&1 | compare %f

@differentiable
func g(x:Float64){
    return x
}

@differentiable
func f(x:Float64){
    return -x
}

@differentiable
func foo(x:Float64){ // EXPECTED: regex multiple returns are not supported by AD yet
    var temp = 1.0
    var index: Float64 = x
    return if (temp > 0.0){
        while (stopGradient<Float64>(index) < 100.0){
            g(x)
            return
        }
    } else{
        while (stopGradient<Float64>(index) < 100.0){
            f(x)
            return
        }
    } 
}

func main() {
    return 0
}