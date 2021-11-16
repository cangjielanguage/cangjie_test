// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex The primal function for function A_init is not found


@differentiable
record A {
    @differentiable
    init(x:Float64){}
}

@adjoint [primal: A]
func A_init(x: Float64): (Float64)*((Float64) -> Float64) {
    let x_square = x * x
    return (
        x_square * x,
        { dy: Float64 =>
            return dy * x_square * 3.0
        }
    )
}

func main(): Int64 {
    return 0
}
