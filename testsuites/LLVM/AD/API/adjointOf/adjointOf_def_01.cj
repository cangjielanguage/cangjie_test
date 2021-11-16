// EXEC-PIPE-1:%compiler %enableAD %n.cj -o %n.out 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@differentiable
func foo(x:Float64, y:Float64){
    return x + y
}

func main(){
    let adj = adjointOf(foo) // EXCEPT: regex have some info
    let (v, bp) = adj(16.0, 1.0)
    let res3 = bp(1.0, 1.0)
    return 0
}