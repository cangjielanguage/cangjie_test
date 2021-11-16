// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan function f failed the differentiability check

func bar(x:Float64) {
    return x
}


@differentiable [except: [y]]
func f(x: Float64, y: String): Float64 {
    do {
        bar(x)
    } while (x > 0.1)
    return x
}

func main(){
    return 0
}