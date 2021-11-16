// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output

class A{
}

extend A {
    @differentiable[except:[this]]
    func f(){}
}

func main(){
    return 0
}