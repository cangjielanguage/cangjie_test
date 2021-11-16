// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output

class A{
    var a : Float64 = 1.0
    @differentiable[except:[this]]
    func f(x: Float64){
        return a + 1.0
    }   
}

func main(){
    return 0
}