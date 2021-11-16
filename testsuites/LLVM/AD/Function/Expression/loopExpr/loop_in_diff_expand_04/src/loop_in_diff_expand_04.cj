// DEPENDENCE: ../src
// EXEC: %compiler %enableAD %cmp_opt -c src/pkg/pkg.cj -o pkg.%middle
// EXEC: %compiler %enableAD %cmp_opt %f pkg.%middle -o %output
// EXEC: %run %run_opt %run_args %output

import pkg.*

func valid(precision: Float64, x0: Float64, gradDx: Float64, diffFunc:(Float64)->Float64){
    var pass = 0.0
    var fail = 0.0
    for (i in 1..10) {
        var dx = 1.0 / Float64(10 ** i)
        var x1 = x0 + dx
        var df = diffFunc(x1) - diffFunc(x0)
        var numericalDx = df / dx
        var diffValue = gradDx - numericalDx
        if (diffValue < 0.0) {
            diffValue = numericalDx - gradDx
        }

        if (diffValue > 0.01) {
            fail = fail + 1.0
        } else {
            pass = pass + 1.0
        }
    }

    let percent_pass = pass/(fail+pass)
    print("${percent_pass}")
    if (percent_pass > 0.7) {
        return true
    }
    return false
}

func main() {
    var v: Float64 = 2.0
    var x = grad(pow2, v)
    if (valid(0.01, v, x, pow2)) {
        return 0
    }
    return 1
}
