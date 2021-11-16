// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan The customized adjoint function foo must be top-level function!
open class A {
    @differentiable[except:[this, y]]
    func goo(x:Float64, y: String){
        x
    }
}

class B <: A{
    @adjoint[primal: goo]
    func foo(x:Float64, y: String){
        (x,
        {a: Float64 => a})
    }

}

func main(){
    return 0
}