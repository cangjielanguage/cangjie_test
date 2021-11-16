// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan The return type of the function adjoint_init should satisfy the first type must be same as the input of the second function

@differentiable
record Point {
    let x: Float64
    let y: Float64
    let z: Float64

    @differentiable
    init(x1: Float64, y1: Float64, z1: Float64) {
        x = x1
        y = y1
        z = z1
    }
}

@adjoint [primal: Point]
func adjoint_init(x1: Float64, y1: Float64, z1: Float64)
{
    print("adjoint init for record")
    (Point(x1, y1, z1).x, {sens: Point =>
        (sens.x, sens.y, sens.z)
    })
}

@differentiable
func foo(x: Float64): Float64 {
    var pt = Point(0.0, x, 0.0)
    var ret = pt.x + pt.y
    return ret
}

func main() {
    var v: Float64 = 2.0
    var x = grad(foo, v)
    print("grad = ${x}")
    return 0
}
