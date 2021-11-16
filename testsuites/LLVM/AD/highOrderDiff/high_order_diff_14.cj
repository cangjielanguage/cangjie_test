// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan function foo failed the differentiability check


@differentiable[stage:2]
func foo(x:String){
    return 2.0
}

func main() {
    return 0
}