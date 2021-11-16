// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
record B{
    var x : Float64

    @differentiable
    init(){
        x = 1.0
    }
    @differentiable
    init(a:Float64){
        x = a
    }
}

record A{}

extend A{
    @differentiable[except:[this]]
    func foo(x:B){
        return if (stopGradient<Float64>(x.x) > 0.0){
            B()
        } else{
            B(1.0)
        }
    }
}

func main(){
    return 0
}