// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable
func foo(x:Float64){
    return x
}

func main(){
    var a = 1.0
    while (valWithGrad(foo,a) > 1.0){ // EXPECTED: regex invalid binary operator '>' on type 'Tuple<Float64, Float64>' and 'Float'
        a = a  + 1.0
    } 
    return 0
}