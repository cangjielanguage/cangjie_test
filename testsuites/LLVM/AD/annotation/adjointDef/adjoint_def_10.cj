// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

@differentiable[except:[y]]
func goo(x:Float64, y: String){
    x
}

@adjoint[] // EXPECTED: regex-auto unexpected []
func foo(x:Float64, y: String){
    (x,
    {a: Float64 => a})
}

func main(){
    return 0
}