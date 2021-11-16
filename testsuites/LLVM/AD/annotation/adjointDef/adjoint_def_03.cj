// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output 

@differentiable[except:[y]]
func goo(x:Float64, y: String){
    x
}

@adjoint[primal: goo]
func foo(x:Float64, y: String){
    (x,
    {a: Float64 => a})
}

func main(){
    return 0
}