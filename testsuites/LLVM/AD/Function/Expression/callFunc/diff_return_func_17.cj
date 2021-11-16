// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out  2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

let a : Float64 = 1.0 // EXPECTED: regex global variable a is not allowed to be used in differentiable function

@differentiable
func foo(x: Float64, y : Float64) {
    return x + y + a
}

func main() {
    var v: Float64 = 2.0
    var x = grad(foo, (2.0, 2.0))
    print("grad = ")
    print(x[0].toString())
    print(" ")
    print("grad = ")
    print(x[1].toString())
    return 0
}