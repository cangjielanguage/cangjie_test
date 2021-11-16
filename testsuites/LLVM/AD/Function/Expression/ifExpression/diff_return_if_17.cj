// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
external record A {
    var val: Float64 = 0.0

    @differentiable
    init(x: Float64) {
        val = x
    }

    @differentiable
    func goo(input: Float64): Float64 {
        if (stopGradient<Float64>(input)>0.0){
            this.val * input
        } else{
            -this.val * input
        }
        
    }
}

func main() {
    return 0
}