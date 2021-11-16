// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out
// EXEC:%n.out 2>&1 | compare %f
// ASSERT: scan grad_z = 0.000000 grad_y = -0.125000 grad_x = -0.062500
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@differentiable[include:[x,y,z]]
func foo(x: Float64, y: Float64, z: Float64): Float64 {
    var temp = x / y
    temp = temp / x
    temp = temp / z / y
    return temp
}

func main() {
    var x = grad(foo, (2.0, 2.0, 2.0))
    print("grad_z = ")
    print(x[0].toString())
    print(" ")
    print("grad_y = ")
    print(x[1].toString())
    print(" ")
    print("grad_x = ")
    print(x[2].toString())
    return 0
}