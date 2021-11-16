// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan The decl of primal function is similar to func P(Float64, Float64, Float64): Record-Point

@differentiable
record Point {
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

@adjoint [primal: P]
func adjoint_init(x1: Float64, y1: Float64, z1: Float64)
{
    print("adjoint init for record")
    (Point(x1, y1, z1), {sens: Point =>
        (sens.x, sens.y, sens.z)
    })
}

func main() {
    return 0
}
