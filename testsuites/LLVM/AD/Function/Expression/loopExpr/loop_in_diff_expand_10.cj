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

        if (diffValue > 0.001) {
            print("\ngrad_dx:${gradDx}\n")
            print("numerical:${numericalDx}\n")
            print("dx:${dx}\n")
            print("i:${i}\n")
            print("diff-value:${diffValue}\n")
            return false
        }
    }
    return true
}


@differentiable
func f(x: Float64): Float64 {
    var r = x
    while (is_true(stopGradient<Float64>(r))) {
        r = r + 1.0
    }
    return x * r
}

func main(){
    var x = grad(f, 2.0)
    if (valid(0.00001, 2.0, x, f)) {
        return 0
    }
    return 1
}