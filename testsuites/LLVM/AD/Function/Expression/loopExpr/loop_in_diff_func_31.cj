// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %use_ast %f -o %output  2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan xxx


@differentiable
func f(x: Float64): Float64{
    var flag = true
    while (flag){
        let v1 = Option<Float64>.Some(2.0)
        v1 ?? 0.0
        flag = false
    }
    return x
}

func main(){
    return 0
}