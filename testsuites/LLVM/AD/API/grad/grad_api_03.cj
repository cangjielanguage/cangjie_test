// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable
func foo(x:Float64){
    return x
}

func main(){
    let a = 1.0
    let temp : Float64 = grad(foo,foo) // EXCEPTED: regex-auto the arguments is not matched for the differentiable function 'foo'
    print(temp.toString())
    return 0
}