// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

class A{
    @differentiable //EXPECTED: regex-auto 'this' parameter in class method must be in except list
    func a(){

    }
}

func main(){
    return 0
}