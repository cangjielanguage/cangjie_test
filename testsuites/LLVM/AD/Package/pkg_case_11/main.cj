// DEPENDENCE: pkg
// EXEC:%compiler %cmp_opt  %enableAD -c pkg/pkg_A.cj -o pkg_A.%middle
// EXEC:%compiler %cmp_opt %enableAD  pkg_A.%middle %n.cj -o %n.out
// EXEC: %n.out 2>&1 | compare %f
// ASSERT: scan dx1 = 36.000000
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@autodiff import pkg_A.*

@adjoint[primal:square]
external func adjoint_square_main(x:Float64){
    return (
        x * x,
        {a : Float64 => 18.0 * a * x}
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
