// EXEC-PIPE-1: %compiler %cmp_opt %enableAD %n.cj -o %n.out 2>&1 | compare %f
// ASSERT: scan function foo failed the differentiability check
@differentiable
func foo(x:Float64, y:Float64){
    var temp = y
    do {
        temp = temp + x
    } while( x < 100.0)

    return x + temp
}

func main(){
    return 0
}