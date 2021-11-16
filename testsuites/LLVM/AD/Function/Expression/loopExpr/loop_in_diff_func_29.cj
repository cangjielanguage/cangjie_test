// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %use_ast %f -o %output  2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan unsupported Char AST node

from ast import ast.*

@differentiable
func f(x: Float64): Float64{
    var r : Float64 = 0.0
    var flag = true
    while (stopGradient<Bool>(flag)){
        var tks = quote(1+a)
        tks.dump()
        flag = false
    }
    return r*x
}

func main(){
    return 0
}