// EXEC-PIPE-1: %compiler %cmp_opt %enableAD %n.cj -o %n.out 2>&1 | compare %f

@differentiable
func foo(x:Int64, y:Int64){
    var temp = y
    for (item in @{1,2}){  // EXPECTED: regex unsupport for-in expr in differentiable function
        temp = temp + item        
    }
    return x + temp
}

func main(){
    return 0
}