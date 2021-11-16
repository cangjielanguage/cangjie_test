// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out
// EXEC:%n.out 2>&1 | compare %f
// ASSERT: scan grad_x = 0.000000 grad_y = -0.125000 grad_z = -0.062500
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@differentiable
func foo(x: Float64, y: Float64, z: Float64): Float64 {
    var temp = x / y
    temp = temp / x
    temp = temp / z / y
    return temp
}

func main() {
    var grad_res = grad(foo, (2.0, 2.0, 2.0))
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