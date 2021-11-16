// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC: %run %run_opt %run_args %output

func is_true(x: Float64){
    if(x < 4.0){
        return true
    }
    return false
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

        if (diffValue > 0.0001) {
            print("\ngrad_dx:${gradDx}\n")
            print("numerical:${numericalDx}\n")
            print("dx:${dx}\n")
            print("i:${i}\n")
            return false
        }
    }
    return true
}

@differentiable
func bar(x: Float64): Float64 {
    return x * x + x
}

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

@differentiable
func f(x: Float64): Float64 {
    var r = x
    var index = x
    while (stopGradient<Float64>(index) < 100.0) {
        if (stopGradient<Float64>(index) < 50.0) {
            r = r + 1.0
            r = r * Point(x, x).y / 0.01
        } else {
            r = r - bar(x)
            r = r / 10.0
        }
        index = index + 1.0
    }
    return x * ((r + x * 100.0) / r - x * 100.0)
}

func main(){
    var x = grad(f, 2.0)
    if (valid(1.0/100000000.0, 2.0, x, f)) {
        return 0
    }
    return 1
}