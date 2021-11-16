// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output 

@differentiable
func goo(x:Float64, y: Float64*Float64){
    y
}

@adjoint[primal: goo]
func foo(x:Float64, y: Float64*Float64){
    (y,
    {a: Float64*Float64 => (x, (x,x))})
}

func main(){
    return 0
}