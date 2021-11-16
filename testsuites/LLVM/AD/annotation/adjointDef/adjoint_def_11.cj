// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan The primal function for function foo is not found.
@differentiable
record A {
    @differentiable[except:[y]]
    func goo(x:Float64, y: String){
        x
    }
}

@adjoint[primal: goo]
func foo(x:Float64, y: String){
    (x,
    {a: Float64 => a})
}

func main(){
    return 0
}