// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
func goo(x:Float64*Float64){

    return (x[0], x[1])
}

func main(){
    return 0
}