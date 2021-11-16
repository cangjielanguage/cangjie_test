// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output

interface A {
    @differentiable[except:[this]]
    func a(x !: Float64):Unit{}
}

func main(){
    return 0
}