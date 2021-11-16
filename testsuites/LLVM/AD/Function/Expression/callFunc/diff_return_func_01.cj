// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out
// EXEC:%n.out 2>&1 | compare %f
// ASSERT: scan grad = 1.000000 grad = 1.000000
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@differentiable
func add(a : Float64, b : Float64){
    return a + b
}


@differentiable
func foo(x: Float64, y : Float64): Float64 {
    
    return add(x,y)
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
