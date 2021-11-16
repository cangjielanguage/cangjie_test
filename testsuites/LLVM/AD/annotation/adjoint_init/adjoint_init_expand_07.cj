// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan The return type of the function adjoint_init should satisfy the second element should be a function type.
// ASSERT: regex-not core dump


@differentiable [except: [y]]
record Point {
    var x: Float64 = 1.0
    var y: String = "2"
    @differentiable
    init(x1: Float64) {
        x = x1
    }
}

@adjoint [primal: Point]
func adjoint_init(x1: Float64)
{
    print("adjoint init for record")
    (Point(x1), 1.0)
}

@differentiable
func foo(x: Float64) {
    var pt = Point(x)
    return pt.x + x
}

func main() {
    return 0
}
