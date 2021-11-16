// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan The primal function for function adjoint_init is not found
// ASSERT: regex-not core dump

@differentiable
record Point {
    let x: Float64
    let y: Float64
    let z: Float64
}

@adjoint [primal: Point]
func adjoint_init(x1: Float64, y1: Float64, z1: Float64)
{
    print("adjoint init for record")
    (Point(x:x1, y:y1, z:z1), {sens: Point =>
        (sens.x, sens.y, sens.z)
    })
}

@differentiable
func foo(x: Float64): Float64 {
    var pt = Point(x:0.0, y:x, z:0.0)
    var ret = pt.x + pt.y + pt.z
    return ret
}

func valid(precision: Float64, x0: Float64, gradDx: Float64, diffFunc:(Float64)->Float64){
    for (i in 1..100) {
        var dx = Float64(i) * precision
        var x1 = x0 + dx
        var df = diffFunc(x1) - diffFunc(x0)
        var numericalDx = df / dx
        var diffValue = gradDx - numericalDx
        if (diffValue < 0.0) {
            diffValue = numericalDx - gradDx
        }

        if (diffValue > 0.00001) {
            print("\ngrad_dx:${gradDx}\n")
            print("numerical:${numericalDx}\n")
            print("dx:${dx}\n")
            print("i:${i}\n")
            return false
        }
    }
    return true
}

func main() {
    var v: Float64 = 2.0
    var x = grad(foo, v)
    if (valid(0.00001, v, x, foo)) {
        return 0
    }
    return 1
}
