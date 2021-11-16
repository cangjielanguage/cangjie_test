// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan unsupported Char AST node

@differentiable
func f(x: Float64): Float64{
    var flag = true
    while (flag){
        try {
            x + 1.0
            x
        } catch(_) {
            print("overflow  exception")
            x
        }
        flag = !flag
    }
    return x
}

func main(){
    return 0
}