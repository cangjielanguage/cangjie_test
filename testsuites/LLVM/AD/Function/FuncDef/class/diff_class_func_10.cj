// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output

open class B{
    static func f(x: Float64){
        return x
    }
}

class A <: B{
    @differentiable
    redef static func f(x: Float64){
        return x + 1.0
    }   
}

func main(){
    return 0
}