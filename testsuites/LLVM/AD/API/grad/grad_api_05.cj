// EXEC-0: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC-0: %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan Gradout = 1.000000

@differentiable
func foo(x:Float64){
    return x
}

func main(){
    let a = 1.0
    let temp : Float64 = grad(foo,a)
    print("Gradout = ")
    print(temp.toString())
    return 0
}