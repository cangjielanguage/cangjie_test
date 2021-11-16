// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

interface A {
    @differentiable// EXPECTED: regex-auto 'this' parameter in interface method must be in except list
    func a():Unit
}

func main(){
    return 0
}