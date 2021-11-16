// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

@differentiable[except: [x] 
func foo(x:Float64, y:Float64){ // EXPECTED: regex-auto expected ']' in the end of annotation
    return 1.0
}

func main(){
    return 1
}