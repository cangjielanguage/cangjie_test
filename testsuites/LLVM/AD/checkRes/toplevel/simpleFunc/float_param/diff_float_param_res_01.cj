// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | %f
// ASSERT: scan need -anable-ad when compile
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


@differentiable
func foo(x:Float32){
    return 1.0
}

func main(){
    let res1 = grad(foo, 1.0)
    return 0
}