// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.st.out

@differentiable
func g(x:Float64){
    return x
}

@differentiable
func f(x:Float64){
    return -x
}

@differentiable
func foo(x:Float64){
    var temp = 1.0
    var index: Float64 = x
    return if (temp > 0.0){
        while (stopGradient<Float64>(x) < 100.0){
            g(x)
        }
    } else{
        while (stopGradient<Float64>(x) < 100.0){
            f(x)
        }
    } 
}

func main() {
    return 0
}