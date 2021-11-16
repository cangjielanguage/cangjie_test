// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan function A::a failed the differentiability check
interface A {
    @differentiable[except:[this]]
    func a(x !: Float64):Int64{
        return 1
    }
}


func main(){
    return 0
}