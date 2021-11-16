// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
record B{
    var x : Float64

    @differentiable
    init(){
        x = 1.0
    }
}

record A{
    @differentiable[except:[this]]
    func foo(x:B){
        
        return if (stopGradient<Float64>(x.x) > 0.0){
            B()
        } else{
            B()
        }
    }
}

func main(){
    return 0
}