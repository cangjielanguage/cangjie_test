// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output

open class A{
    @differentiable[except:[this]]
    func a(x:Float64){

    }
}

func main(){
    return 0
}