// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output 

@differentiable
func goo(x:Float64){
    x
}

@adjoint[primal: goo]
func foo(x:Float64){
    var temp =  {a: Float64 => a}
    (x,
    temp)
}

func main(){
    return 0
}