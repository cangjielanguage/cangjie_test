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

@adjoint [primal: Point]
external func adjoint_init(x1: Float64, y1: Float64, z1: Float64)
{
    print("adjoint init for record")
    (Point(x1, y1, z1), {sens: Point =>
        (sens.x, sens.y, sens.z)
    })
}