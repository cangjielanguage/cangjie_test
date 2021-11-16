// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output  2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan unsupport match expr in differentiable function

@differentiable
func f(x: Float64): Float64{
    var r : Float64 = match (x) {
        case _ => 4.0
    }
    return r*x
}

func main(){
    return 0
}