// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
func foo(x:Float64){
    var temp = x
    while (stopGradient<Float64>(temp) < 100.0){
        temp = temp + 20.0
    }
    return x * temp
    
}


func main() {
    return 0
}