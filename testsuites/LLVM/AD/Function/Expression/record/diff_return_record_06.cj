// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
record B{
    var x : Float64
}

record A{
    @differentiable[except:[this]]
    func foo(x:B){
        
        return if (stopGradient<Float64>(x.x) > 0.0){
            x.x - 1.0
        } else{
            x.x + 1.0
        }
    }
}

func main(){
    return 0
}