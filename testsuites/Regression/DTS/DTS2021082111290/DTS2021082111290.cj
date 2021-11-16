// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

@differentiable
func foo(x:Float64,y:Float64){
    return x : y
}


func goo(x:Float64, y:Float64){
    let temp = grad(foo,(x,y))
    print("gradout_1 = ")
    print(temp[0].toString())
    print("gradout_1 = ")
    print(temp[1].toString())
    return temp
}

func main(){
    let a = goo(1.0,2.0)
    return 0
