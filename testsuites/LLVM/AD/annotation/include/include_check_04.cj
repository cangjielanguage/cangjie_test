// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

@differentiable[include:{x}] // EXPECTED: regex-auto argument to 'include' must be a list
func foo(x:Float64){
    return 1.0
}

func main(){
    return 1
}