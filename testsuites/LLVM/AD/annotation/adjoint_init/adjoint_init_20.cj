// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan The return type of the function adjoint_init should satisfy the return type of the second function must be all in the inputs
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
    (Point(x1), {sens: Point => sens.y
    })
}

@differentiable
func foo(x: Float64) {
    var pt = Point(x)
    return pt.x + x
}

func main() {
    return 0
}
