// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan function A::a failed the differentiability check
class A{
    @differentiable[except:[this]]
    func a(x: B){

    }
}

record B{

}

func main(){
    return 0
}