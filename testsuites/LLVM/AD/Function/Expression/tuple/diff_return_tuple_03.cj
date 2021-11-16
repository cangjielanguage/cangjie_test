// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
func foo(x:Float64, y:Float64){
    return (x,y)
}

@differentiable
func goo(x:Float64, y:Float64){
    var a = foo(x,y)
    return a
}

func main(){
    return 0
}