// EXEC-PIPE-1:%compiler %cmp_opt %enableAD %n.cj -o %n.out 2>&1 | compare %f
// ASSERT: scan function foo failed the differentiability check

@differentiable
record A{
    var x:Int16
    init(){
        x = 1
    }
}

@differentiable
func foo(x:Float64){
    var temp = A()
    return temp.x
}

func main(){
    return 0
}