// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
func goo(x:Float64*Float64){
    var (a,b) = x
    return (a,b)
}

func main(){
    return 0
}