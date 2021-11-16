// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
record B{
    var x : Float64
}

interface A{
    @differentiable[except:[this]]
    func foo(x:B){
        return x
    }
}

func main(){
    return 0
}