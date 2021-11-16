// EXEC: %compiler %enableAD %cmp_opt %f -o %output  2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan multiple returns are not supported by AD yet

@differentiable
func f(x: Float64): Unit {
    return while (true){}
}

func main(){
    return 0
}