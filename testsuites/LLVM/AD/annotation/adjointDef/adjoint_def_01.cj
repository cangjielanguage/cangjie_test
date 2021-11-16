// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output 

@differentiable
record A {}

@differentiable
func goo(x:Float64, y: A){
    y
}

@adjoint[primal: goo]
func foo(x:Float64, y: A){
    (y,
    {a: A => (x, a)})
}

func main(){
    return 0
}