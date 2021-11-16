// DEPENDENCE: pkg
// EXEC:%compiler %cmp_opt  %enableAD -c pkg/pkg_A.cj -o pkg_A.%middle 2>&1 | compare %f
// ASSERT: scan The primal function for function adjoint_square_a is not found
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import pkg_A.*
import pkg_B.*

@differentiable
external func square(x: Float64): Float64 {
    x * x
}

@adjoint[primal:square]
external func adjoint_square_main(x:Float64){
    return (
        x * x,
        {a : Float64 => 8.0 * a * x}
    )
}

func testStage1()
{
    var x: Float64 = 2.0
    var dx1 = grad(square, x) 
    print("dx1 = ${dx1}")
}

func main(): Int64 {
    testStage1()
    0
}
