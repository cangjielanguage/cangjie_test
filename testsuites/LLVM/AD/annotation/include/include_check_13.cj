// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

class A {
    @differentiable[include: [this, y]] // EXPECTED: regex-auto 'this' parameter in class method must be in except list
    func foo(x:Float64, y : Float64){
        return x
    }
}


func main(){
    return 0
}