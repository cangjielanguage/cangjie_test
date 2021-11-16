// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable[except:[y]]
func goo(x: Float64, y:Float64){
    var temp = y
    return while(temp < 3.0){
        temp = temp + 1.0
        x*x
    }
}

func main() {
    return 0
}