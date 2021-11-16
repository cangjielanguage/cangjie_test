// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

@differentiable
func f(x : Float64){
    return stopGradient<Unit>(())
}

func main(){
    var x = 2.0
    var dx = grad(f, x)  // EXPECT: regex the return type of function 'f' is not float
    return 0
}
