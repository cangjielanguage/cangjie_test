// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output

interface A {
    func a(x:Int64):Int64
}

interface B <: A{
    @differentiable[except:[this]]
    func a(x !: Float64){}
    
}

func main(){
    return 0
}