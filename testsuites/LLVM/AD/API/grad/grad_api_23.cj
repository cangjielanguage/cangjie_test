// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
interface B {}

class A <: B{
    @differentiable[except:[this]]
    func goo(x:Float64){
        return x 
    }
}


func main(){
    let a = A()
    var res = grad(a.goo, 2.0) // EXPECTED: regex the function is not a top-level differentiable function identifier
    return 0
}