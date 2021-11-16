// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out 2>&1 | compare %f
// ASSERT: scan multiple returns are not supported by AD yet

@differentiable
func pow(x: Float64, y: Float64) {
    var r: Float64 = 1.0
    var index: Float64 = y
    while (stopGradient<Float64>(index) > 0.0) {
        r = r * x
        index = index - 1.0  
        return r
    }

    return r

}

func main() {
    var v: Float64 = 2.0
    return 0
}
