// EXEC: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable [stage: 2, except:[y]]
func square(x: Float64, y:String): Float64 {
    x * x
}

@differentiable [except:[y]]
@adjoint [primal: square]
func adjointSquare(x: Float64, y:String) {
    (x * x, { sens: Float64 =>
        2.0 * x * sens
    })
}

@differentiable
func squareGrad(x: Float64)
{
    let adj0 = adjointOf(square)
    let (v1, bp1) = adj0(x, "hi")
    bp1(v1)
}

func testStage1()
{
    var x: Float64 = 2.0
    var dx = grad(square, (x,"1"))
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