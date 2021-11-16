// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
record B{
    var x : Float64
}

class A{
    @differentiable[except:[this]]
    func foo(x:B){
        return x.x
    }
}

func main(){
    return 0
}