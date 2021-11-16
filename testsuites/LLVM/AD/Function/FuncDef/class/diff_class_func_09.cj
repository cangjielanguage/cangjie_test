// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

open class B{
    static func f(x: Float64){
        return x
    }
}

class A <: B{
    @differentiable[except:[this]] 
    redef static func f(x: Float64){ // EXPECTED: regex-auto 'this' is not found in parameter list
        return x + 1.0
    }   
}

func main(){
    return 0
}