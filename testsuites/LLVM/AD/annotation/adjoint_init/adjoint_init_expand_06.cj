// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan record doesn't support annotation 'adjoint'

@adjoint [primal: Point]
record Point {
    let x: Float64
    let y: Float64

    init(x1: Float64, y1: Float64) {
        x = x1
        y = y1
    }
}

func main() {
    Point(2.0, 1.0)
    return 0
}
