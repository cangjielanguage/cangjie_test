// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
func foo(x:Float64*Float64){
    var (a,b) = x
    return (a,b)
}

@differentiable
func goo(x:Float64*Float64){
    var temp = foo(x)
    return temp
}

func main(){
    return 0
}