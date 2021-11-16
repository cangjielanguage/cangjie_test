// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex The customized adjoint function g must be top-level function!

record Point{
    @differentiable[except:[this]]
    func f(x : Float32){
        return x
    }

    @adjoint[primal: f] 
    func g(x:Float32){
        let temp : Float32 = 0.0 
        return (
            temp, 
            {dy: Float32 => return dy} 
        )
    }
}

func main(){
    return 0
}