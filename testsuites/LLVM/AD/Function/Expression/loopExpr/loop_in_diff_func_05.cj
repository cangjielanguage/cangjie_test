// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan unsupport jump expr in differentiable function

@differentiable
func f(x : Float64): Float64{
    do { break } while (false)
    return x
}

func main(){
    return 0
}