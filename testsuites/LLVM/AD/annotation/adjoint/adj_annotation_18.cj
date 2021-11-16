// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output 

@differentiable
func f(x : Float32, y : Float32){
    return x * y
}

@adjoint[primal:f]
func g(x : Float32, y : Float32){
    let temp : Float32 = 0.0 
    return (
        temp, 
        {dy: Float32 => return (dy, dy)}
    )
}

func main(){
    return 0
}