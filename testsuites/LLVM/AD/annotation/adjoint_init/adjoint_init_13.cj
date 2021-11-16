// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan The primal function for function adjoint_init is not found

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
func adjoint_init()
{
    print("adjoint init for record")
    (Point(0.0, 0.0, 0.0), {sens: Point =>()
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
