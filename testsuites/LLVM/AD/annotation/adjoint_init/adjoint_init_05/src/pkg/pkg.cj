package pkg

@differentiable
external record Point {
    let x: Float64
    let y: Float64
    let z: Float64

    @differentiable
    init(x1: Float64, y1: Float64, z1: Float64) {
        x = x1
        y = y1
        z = z1
    }
}