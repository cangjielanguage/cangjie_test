// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
record A{
    var x:Float64
    init(){
        x = 1.0
    }
}

@differentiable
func foo(x:Float64){
    var temp = A()
    return x + temp.x
}

func main(){
    return 0
}