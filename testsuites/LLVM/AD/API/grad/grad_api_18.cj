// EXEC-0: %compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC-0: %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
// ASSERT: scan gradout_1 = 2.000000gradout_1 = 1.000000

@differentiable
func foo(x:Float64,y:Float64){
    return x * y
}

class A{
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