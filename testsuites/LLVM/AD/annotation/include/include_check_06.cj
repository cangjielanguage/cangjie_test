// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

@differentiable[include: [(x, y)]] // EXPECTED: regex-auto expected identifier here
func foo(x:Float64, y:Float64){
    return 1.0
}

func main(){
    return 1
}