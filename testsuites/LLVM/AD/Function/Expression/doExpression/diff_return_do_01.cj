// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
func foo(x:Float64, y:Float64){
    var temp = y
    do{
        temp = temp + x
    } while(stopGradient<Float64>(x) > 100.0)

    return x + temp
}

func main(){
    foo(1.0,2.0)
    return 0
}