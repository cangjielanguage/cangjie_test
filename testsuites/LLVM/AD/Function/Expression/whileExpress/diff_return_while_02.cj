// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable
func pow(x: Float64, y: Float64) {
    var r: Float64 = 1.0
    var index: Float64 = y
    return while (stopGradient<Float64>(index) > 3.0) { 
        r = r * x
        index = index - 1.0
        
    }

}

func main() {
    return 0
}
