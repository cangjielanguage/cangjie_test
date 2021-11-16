// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.st.out

@differentiable
func foo(x:Float64){
    var temp = x
    while (stopGradient<Float64>(temp) < 100.0){
        if (stopGradient<Float64>(temp) < 50.0){
            temp = temp + 10.0
        } else{
            temp = temp + 20.0
        }
        temp = temp + 20.0
    }
    return x * temp
}


func main() {
    return 0
}