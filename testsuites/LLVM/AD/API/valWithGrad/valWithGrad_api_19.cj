// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable
func foo(x:Float64,y:Float64){
    return x * y
}

class A{
    @differentiable[except:[this]]
    func goo(x:Float64, y:Float64){
        let valWithGrad_res = valWithGrad(foo,(x,y)) // EXPECTED: regex func foo in valWithGrad in differentiable function must be of stage 2
        let (foo_res, foo_grad) = valWithGrad_res
        return (foo_res, foo_grad)
    }
}


func main(){
    let a = A()
    var (foo_res, foo_grad) = a.goo(1.0,2.0)
    print("foo_res = ")
    print(foo_res.toString())
    print("foo_grad = ")
    print(foo_grad[0].toString())
    print("foo_grad = ")
    print(foo_grad[1].toString())
    return 0
}