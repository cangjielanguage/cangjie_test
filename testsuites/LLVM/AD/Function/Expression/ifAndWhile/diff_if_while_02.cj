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
    while (stopGradient<Float64>(index) < 100.0){
        if (temp > 0.0){
            g(x)
        } else{
            f(x)
        } 
        temp = temp - 1.0
        index = index - 1.0
    }
    return temp
}



func main() {
    return 0
}