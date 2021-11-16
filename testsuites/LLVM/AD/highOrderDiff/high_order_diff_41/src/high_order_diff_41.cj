// DEPENDENCE: ../src
// EXEC: %compiler %enableAD %cmp_opt -c src/pkg/pkg.cj -o pkg.%middle
// EXEC: %compiler %enableAD %cmp_opt %f pkg.%middle -o %output
// EXEC: %run %run_opt %run_args %output

@autodiff import pkg.*


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
    if (dx >= 4.000001 || dx <= 3.999999){
        return 1
    }
    if (dxdx >= 24.000001 || dxdx <= 23.999999){
        return 1
    }
    return 0
}
