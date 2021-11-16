// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex function f failed the differentiability check

record Point {
    let x: Float64
    let y: Float64
    init(x1: Float64, y1: Float64) {
        x = x1
        y = y1
    }
}



@differentiable [except: [y]]
func f(x: Float64, y: String): Float64 {
    var r = 1.0
    while (Point(x, 2.0).x > 2.0) {
        r = x + 1.0
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