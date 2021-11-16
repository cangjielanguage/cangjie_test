// DEPENDENCE: ../src
// EXEC: %compiler %enableAD %cmp_opt -c src/pkg/pkg.cj -o pkg.%middle
// EXEC: %compiler %enableAD %cmp_opt %f pkg.%middle -o %output
// EXEC-PIPE-0: %run %run_opt %run_args %output 2>&1 | compare %f
// ASSERT: scan adjoint init for record

import pkg.*

@adjoint [primal: Point]
func adjoint_init(x1: Float64, y1: Float64, z1: Float64)
{
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
