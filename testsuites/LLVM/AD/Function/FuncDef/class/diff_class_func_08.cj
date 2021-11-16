// EXEC: %compiler %enableAD %cmp_opt %f -o %output

open class B{
    open func f(x: Float64){
        return x
    }
}

class A <: B{
    @differentiable[except:[this]]
    override func f(x: Float64){
        return x + 1.0
    }   
}

func main(){
    return 0
}