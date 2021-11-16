// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
@differentiable[stage: 3] // EXPECTED: regex invalid stage value, integer literal \(1 and 2 are supported now\) is expected
func add(x: Float64): Float64 {
    x + x
}

@differentiable [stage: 2]
@adjoint [primal: add]
func square(x: Float64): Float64 {
    (x * x, { sens: Float64 =>
        2.0 * x * sens
    })
}

@differentiable 
@adjoint [primal: square]
func adjointSquare(x: Float64) {
    (x * x, { sens: Float64 =>
        2.0 * x * sens
    })
}

@differentiable
func squareGrad(x: Float64)
{
    let adj0 = adjointOf(square)
    let (v1, bp1) = adj0(x)
    bp1(1.0)
}

func testStage1()
{
    var x: Float64 = 2.0
    var dx1 = grad(square, x)
    print("dx1 = ${dx1}")
}

func testStage2()
{
    var v: Float64 = 2.0
    var dxdx = grad(squareGrad, v)
    print(" dxdx = ${dxdx}")
}

func main() {
    testStage1()
    testStage2()
    return 0
}