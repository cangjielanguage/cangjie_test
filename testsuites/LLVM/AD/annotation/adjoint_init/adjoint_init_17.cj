// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %run_args %output 2>&1 | compare %f
// ASSERT: scan adjoint init for record

@differentiable
record Point {
    var p: Float64 = 1.0
    @differentiable
    init() {}
}

@adjoint [primal: Point]
func adjoint_init()
{
    print("adjoint init for record")
    (Point(), {sens: Point => ()
    })
}

@differentiable
func foo(x: Float64) {
    var pt = Point()
    return pt.p + x
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
    if (valid(0.0001, v, x, foo)) {
        return 0
    }
    return 1
}