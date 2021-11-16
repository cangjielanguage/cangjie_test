// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %run_args %output 2>&1 | compare %f
// ASSERT: scan adjoint init1 for record
// ASSERT: scan adjoint init2 for record
// ASSERT: scan adjoint init3 for record

@differentiable
record Point {
    let x: Float64
    let y: Float64
    var z: Float64 = 0.3

    @differentiable
    init(x1: Float64) {
        x = x1
        y = x1
    }
    @differentiable
    init(x1: Float64, y1:Float64) {
        x = x1
        y = y1
    }
    @differentiable
    init(x1: Float64, y1: Float64, z1:Float64) {
        x = x1
        y = y1
        z = z1
    }
}

@adjoint [primal: Point]
func adjoint_init(x1: Float64)
{
    print("adjoint init1 for record")
    (Point(x1), {sens: Point => sens.x
    })
}

@adjoint [primal: Point]
func adjoint_init(x1: Float64, y1: Float64)
{
    print("adjoint init2 for record")
    (Point(x1, y1), {sens: Point =>
        (sens.x, sens.y)
    })
}

@adjoint [primal: Point]
func adjoint_init(x1: Float64, y1: Float64, z1: Float64)
{
    print("adjoint init3 for record")
    (Point(x1, y1, z1), {sens: Point =>
        (sens.x, sens.y, sens.z)
    })
}

@differentiable
func foo1(x: Float64): Float64 {
    var pt1 = Point(x)
    var ret = pt1.x
    return ret
}

@differentiable
func foo2(x: Float64, y:Float64): Float64 {
    var pt2 = Point(x, y)
    var ret = pt2.x + pt2.y
    return ret
}

@differentiable
func foo3(x: Float64, y:Float64, z:Float64): Float64 {
    var pt3 = Point(x, y, z)
    var ret = pt3.x + pt3.y + pt3.z
    return ret
}

func main() {
    var v: Float64 = 2.0
    var x1 = grad(foo1, v)
    var x2 = grad(foo2, (v, 2.0))
    var x3 = grad(foo3, (v,2.0,3.0))

    if (x1 >= 1.000001 || x1 <= 0.999999) {
        return 1
    }
    if (x2[1] >= 1.000001 || x2[1] <= 0.999999) {
        return 1
    }
    if (x3[2] >= 1.000001 || x3[2] <= 0.999999) {
        return 1
    }
    return 0
}
