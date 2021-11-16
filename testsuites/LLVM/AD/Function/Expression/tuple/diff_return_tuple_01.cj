// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
func goo(x:Float64, y:Float64){
    return (x,y)
}

func main(){
    return 0
}