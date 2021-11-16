// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

interface A{}

class B <: A{
    @differentiable[except:[]] // EXPECTED: regex-auto 'this' parameter in class method must be in except list
    func a(x: Float64){
        return x
    }
}
func main(){
    return 0
}