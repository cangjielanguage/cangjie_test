// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: regex func foo in grad in differentiable function must be of stage 2

@differentiable
func foo(x:Float64,y:Float64){
    return x * y
}

class A{
    @differentiable[except:[this]]
    func goo(x:Float64, y:Float64){
        let temp = grad(foo,(x,y))
        return temp
    }
}


func main(){
    let a = A()
    var temp = a.goo(1.0,2.0)
    print("gradout_1 = ")
    print(temp[0].toString())
    print("gradout_1 = ")
    print(temp[1].toString())
    return 0
}