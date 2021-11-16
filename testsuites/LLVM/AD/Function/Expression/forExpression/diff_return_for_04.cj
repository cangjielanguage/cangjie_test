// EXEC-PIPE-1: %compiler %cmp_opt %enableAD %n.cj -o %n.out 2>&1 | compare %f

@differentiable
func foo(x:Float64, y:Float64){
    return for (item in @{1,2}){       // EXPECTED: regex  unsupport for-in expr in differentiable function
    }
}

func main(){
    return 0
}