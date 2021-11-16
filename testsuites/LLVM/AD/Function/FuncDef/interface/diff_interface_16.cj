// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

interface A{
    @differentiable[except:[this]] // EXPECTED: regex-auto annotation on expressions other than function/record definition is not supported
    prop let s: String 
}

func main(){
    return 1
}
