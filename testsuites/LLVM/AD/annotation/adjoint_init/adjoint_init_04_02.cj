// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable
record Point {
    let x: Float64
    let y: Float64
    let z: Float64

    @differentiable
    init(x1: Float64, y1: Float64, z1: Float64) {
        x = 3.0 * x1
        y = 4.0 * y1
        z = 5.0 * z1
    }
}

@differentiable
func foo(x: Float64): Float64 {
    var pt = Point(0.0, x, 0.0)
    var ret = 1.0 * pt.x + x * pt.y
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
    if (valid(Float64(1/10000), v, x, foo)) {
        return 0
    }
    return 1
}
