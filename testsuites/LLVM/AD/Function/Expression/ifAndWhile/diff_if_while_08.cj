// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.st.out

@differentiable
func foo(x:Float64){
    var temp = 1.0
    var index: Float64 = x
    if (temp > 0.0){
        while (stopGradient<Float64>(index) < 100.0){
            index = index - 1.0
            temp = temp + 1.0
        }
    } else{
        while (stopGradient<Float64>(index) < 100.0){
            index = index - 1.0
            temp = temp + 1.0
        }
    } 

    return temp
}

func main() {
    return 0
}