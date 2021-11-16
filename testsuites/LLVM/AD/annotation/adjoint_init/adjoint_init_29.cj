// EXEC: %compiler %enableAD %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %run_args %output

@differentiable
record Point {}

@adjoint [primal: Point]
func adjoint_init()
{
    print("adjoint init for record")
    (Point(), {sens: Point => ()
    })
}

@differentiable
func foo(x: Float64) {
    return Point()
}

func main() {
    return 0
}