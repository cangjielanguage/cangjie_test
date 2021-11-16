// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

class A{
    @differentiable 
    init(x:Float64){ // EXPECTED: regex-auto differentiable function init can't return non-differentiable type A

    }
}

func main(){
    return 0
}