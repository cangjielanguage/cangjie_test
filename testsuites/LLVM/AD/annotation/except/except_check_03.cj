// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

@differentiable[except:[x,y]] 
func foo(x:Float64){ // EXPECTED: regex-auto 'y' is not found in parameter list
    return 1.0
}

func main(){
    return 1
}