// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out
// EXEC:%n.out 2>&1 | compare %f
// ASSERT: scan grad_x = 4.500000 grad_y = -0.500000 grad_z = 0.000000
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@differentiable
func foo(x: Float64, y: Float64, z: Float64): Float64 {
    return x * x + x / y
}

func main() {
    var v: Float64 = 2.0
    var grad_res = grad(foo, (v, v, v))
    print("grad_x = ")
    print(grad_res[0].toString())
    print(" ")
    print("grad_y = ")
    print(grad_res[1].toString())
    print(" ")
    print("grad_z = ")
    print(grad_res[2].toString())
    return 0
}