// EXEC: %compiler %enableAD %cmp_opt %f -o %output  2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan multiple returns are not supported by AD yet

@differentiable
func f(x: Float64): Float64{
    while (x > 0.1){
        return x
    }
    return x
}

func main(){
    return 0
}