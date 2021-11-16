// EXEC: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: scan function f failed the differentiability check

record A {
    var a:Float64
    init(x:Float64) {
        a = x
    }
}

@differentiable [except: [y]]
func f(x: Float64, y: String): Float64 {
    do {
        A(x)
    } while (x > 0.1)
    return x
}

func main(){
    return 0
}