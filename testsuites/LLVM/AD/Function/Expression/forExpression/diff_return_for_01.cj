// EXEC-PIPE-1: %compiler %cmp_opt %enableAD %n.cj -o %n.out 2>&1 | compare %f

@differentiable
func foo(x:Float64, y:Float64){
    for (item in [0.0, 1.0, 2.0, 3.0, 4.0]){ // EXPECTED: regex unsupport for-in expr in differentiable function
        
    }
    return x + y
}

func main(){
    return 0
}