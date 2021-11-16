// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan differentiable function foo cannot return non-differentiable type String

@differentiable[stage:2]
func foo(x:Float64, y:Float64, z:Float64){
    var a = x*y+z
    return "hi"
}

func main() {
    return 0
}