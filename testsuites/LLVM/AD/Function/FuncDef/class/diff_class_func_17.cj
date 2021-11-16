// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan variable a has non-differentiable type A but it does not appear in an except list

@differentiable
record B{
    var a : A
}

class A{
    @differentiable[except:[this]]
    func a(x: B){
        return x
    }
}


func main(){
    return 0
}