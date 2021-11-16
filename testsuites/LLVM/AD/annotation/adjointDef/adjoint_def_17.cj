// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan multiple local adjoint for function goo are found

@differentiable
func goo(x:Float64){
    return x
}

@adjoint[primal: goo]
func foo1(x:Float64){
    (1.0,
    {temp: Float64 => temp})
}

@adjoint[primal: goo]
func foo2(x:Float64){
    (2.0,
    {temp: Float64 => 2.0*temp})
}

func main(){
    return 0
}
