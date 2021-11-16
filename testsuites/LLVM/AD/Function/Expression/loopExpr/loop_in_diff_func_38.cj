// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan unsupported Char AST node

@differentiable
func f(x: Float64): Float64{
    var flag = true
    while (flag){
        spawn{print("hi")}
        flag = !flag
    }
    return x
}

func main(){
    return 0
}