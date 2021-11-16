// EXEC:%compiler %cmp_opt %enableAD -overflow no  %n.cj -o %n.out 2>&1 | compare %f
// ASSERT: scan function add failed the differentiability check
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@differentiable
func add(a : Float64, b : Float64){
    return 1 + 2
}

@differentiable
func foo(x: Float64, y : Float64){
    
    return add(x, y)
}

func main() {
    return 0
}