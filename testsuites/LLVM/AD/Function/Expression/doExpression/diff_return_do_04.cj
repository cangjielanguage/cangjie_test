// EXEC: %compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
func foo(x:Float64, y:Float64){
    var temp = y
    var index = x
    return do{
        temp = temp + x
    } while(stopGradient<Float64>(x) > 100.0)
}   

func main(){
    return 0
}