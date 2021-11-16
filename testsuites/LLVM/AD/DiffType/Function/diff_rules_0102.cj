// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -o %output  2>&1 | compare %f
// ASSERT: regex function foo failed the differentiability check
// ASSERT: regex error caused by y appearing in expression

@differentiable
func foo(x:Float16,y:Float32,z:Float64) {
    var a = Coo(y)
    return a.foo()
}

record Coo{
    var a:Float64 = 1.0
    var b:Float32 = 1.0
    Coo(x:Float32){
        b = x
    }
    func foo(){
        return b*Float32(2.0)
    }
}

func main():Int64 {
    var a:Float16 = 1.0
    var b:Float32 = 1.0
    var c:Float64 = 1.0
    var res = foo(a,b,c)
    if ( res != 1.0 ){
        return 1
    }
    return 0
}
