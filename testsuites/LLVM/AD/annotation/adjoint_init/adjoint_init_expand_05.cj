// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan annotation on expressions other than function/record definition is not supported

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
var adjoint_init = { x1: Float64, y1: Float64, z1: Float64 =>
    print("adjoint init for record")
    (Point(x1, y1, z1), {sens: Point =>
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
    if (x >= 1.000001 || x <= 0.999999) {
        return 1
    }
    return 0
}
