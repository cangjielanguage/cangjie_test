// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

@differentiable
record Point {
    let x: Float64
    let y: Float64

    @differentiable
    init(x1: Float64, y1: Float64) {
        x = x1
        y = y1
    }
}



@differentiable [except: [y]]
func f(x: Float64, y: String): Float64 {
    var a = Point(x, 2.0)
    var r = 1.0
    while (stopGradient<Float64>(x) > stopGradient<Float64>(a.y)) {
        r = a.x
    }
    return x * r
}

func main(){
    var x =grad(f, (2.0, "hi"))
    if (x == 1.0) {
        return 0
    }
    return 1
}