// EXEC: %compiler %enableAD %cmp_opt %f -o %output

abstract class A{
    @differentiable[except:[this]]
    func a():Unit 
}

func main(){
    return 0
}