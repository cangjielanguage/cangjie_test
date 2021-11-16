// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output  

@differentiable
func f(x : Float64){
    return x 
}

@adjoint[primal:f]
func g(x:Float64){
    return (
        1.0,
        {dy: Float64 => return 2.0}
    )
}

func main(){
    return 0
}