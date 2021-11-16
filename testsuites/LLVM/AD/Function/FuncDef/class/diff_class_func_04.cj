// EXEC: %compiler %enableAD %cmp_opt %f -o %output

class A{
    @differentiable
    static func a(){

    }
}

func main(){
    return 0
}