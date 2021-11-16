// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan adjoint annotation only be used in global function

class Point {
    let x: Float64
    let y: Float64

    @adjoint [primal: Point]
    init(x1: Float64, y1: Float64) {
        x = x1
        y = y1
    }
}

func main() {
    return 0
}
