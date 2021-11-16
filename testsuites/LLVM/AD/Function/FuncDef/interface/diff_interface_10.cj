// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

interface A {
    func a(x:Int64):Int64{
        return 1
    }
}

interface B <: A{
    @differentiable // EXPECTED: regex-auto 'this' parameter in interface method must be in except list
    func a(x !: Float64){}
    
}

func main(){
    return 0
}