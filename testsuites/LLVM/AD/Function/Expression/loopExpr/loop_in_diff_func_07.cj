// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan unsupport increment/decrement expr in differentiable function

@differentiable [except: [y]]
func f(x: Float64, y: String): Float64 {
    var a: Float64 = 0.1
    do {
        x+x
        a--
    } while (x > 0.1)
    return x
}

func main(){
    return 0
}