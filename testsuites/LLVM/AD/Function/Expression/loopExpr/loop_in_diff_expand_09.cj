// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex function f failed the differentiability check

func b(x: Float64){
    if(x < 4.0){
        return true
    }
    return false
}



@differentiable [except: [y]]
func f(x: Float64, y: String): Float64 {
    var r = x
    while (b(r)) {
        r = x + 1.0
    }
    return x * r
}

func main(){
    var x = grad(f, (2.0, "hi"))
    if (x == 1.0) {
        return 0
    }
    return 1
}