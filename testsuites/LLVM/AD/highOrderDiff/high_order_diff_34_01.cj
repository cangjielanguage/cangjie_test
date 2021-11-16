// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan func adjointSquare in adjointOf in differentiable function must be of stage 2

@differentiable [stage: 2]
func square(x: Float64): Float64 {
    x * x
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
    let adj0 = adjointOf(adjointSquare)
    let (v1, bp1) = adj0(x)
    bp1(v1)
}

func testStage1()
{
    var x: Float64 = 2.0
    var dx = grad(square, x)
    return dx
}

func testStage2()
{
    var v: Float64 = 2.0
    var dxdx = grad(squareGrad, v)
    return dxdx
}

func main() {
    let dx = testStage1()
    let dxdx = testStage2()
    print("${dx}\n")
    print("${dxdx}\n")
    if (dx >= 4.000001 || dx <= 3.999999){
        return 1
    }
    if (dxdx >= 24.000001 || dxdx <= 23.999999){
        return 1
    }
    return 0
}