// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out
// EXEC:%n.out 2>&1 | compare %f
// ASSERT: scan grad_y = -1.000000 grad_z = 1.000000
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@differentiable[include:[y,z]]
func foo(x: Float64, y: Float64, z: Float64): Float64 {
    return x - y + z
}

func main() {
    var grad_res = grad(foo, (2.0, 2.0, 2.0))
    print("grad_y = ")
    print(grad_res[0].toString())
    print(" ")
    print("grad_z = ")
    print(grad_res[1].toString())
    return 0
}