// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

class A{
    @differentiable[except:[x]] // EXPECTED: regex-auto 'this' parameter in class method must be in except list
    func a(x:Int64){

    }
}

func main(){
    return 0
}