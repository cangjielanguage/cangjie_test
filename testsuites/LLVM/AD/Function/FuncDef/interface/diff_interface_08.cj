// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output

interface A {
}

interface B <: A{
    @differentiable[except:[this]]
    func a(x !: Float64){}
    
}

func main(){
    return 0
}