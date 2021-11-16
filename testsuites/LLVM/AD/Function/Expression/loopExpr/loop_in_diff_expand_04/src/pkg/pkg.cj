package pkg

@differentiable
external func pow2(x: Float64) {
    var r: Float64 = 1.0
    var index: Float64 = 5.0
    while (stopGradient<Float64>(index) > 3.0) {
        r = r * x
        index = index - 1.0

    }
    return x * r

}