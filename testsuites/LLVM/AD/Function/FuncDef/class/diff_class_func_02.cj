// EXEC: %compiler %enableAD %cmp_opt %f -o %output

class A{
    @differentiable[except:[this]]
    func a(){

    }
}

func main(){
    return 0
}