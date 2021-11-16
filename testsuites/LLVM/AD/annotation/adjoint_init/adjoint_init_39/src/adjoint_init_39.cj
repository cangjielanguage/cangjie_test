// DEPENDENCE: ../src
// EXEC: %compiler %enableAD %cmp_opt -c src/pkg/pkg.cj -o pkg.%middle
// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f pkg.%middle -o %output 2>&1 | compare %f
// ASSERT: scan xxx

import pkg.Point

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
