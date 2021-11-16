// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan function A::a failed the differentiability check
interface A {
    @differentiable[include:[x]]
    func a(x : Int64):Unit{}
}

func main(){
    return 0
}