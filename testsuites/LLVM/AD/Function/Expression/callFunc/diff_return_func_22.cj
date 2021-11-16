// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out
// EXEC:%n.out 2>&1 | compare %f
// ASSERT: scan grad = true
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


@differentiable
func foo() {
    return 1.0
}

func main() {
    var x = grad(foo, ())
    print("grad = ")
    let a = x==()
    print(a.toString())
    return 0
}