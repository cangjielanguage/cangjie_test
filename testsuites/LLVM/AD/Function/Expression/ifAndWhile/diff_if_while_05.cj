// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.st.out

@differentiable
record A{
    var a : Float64 = 1.0
    var b : Float64 = 2.0

    @differentiable
    func foo(x:Float64){
        var temp = 1.0
        var index: Float64 = x
        if (temp > 0.0){
            while (stopGradient<Float64>(index) < 100.0){
                index = index - this.a
                temp = temp + this.a
            }
        } else{
            while (stopGradient<Float64>(index) < 100.0){
                index = index - this.b
                temp = temp + this.b
            }
        } 

        return temp
    }
}


func main() {
    return 0
}