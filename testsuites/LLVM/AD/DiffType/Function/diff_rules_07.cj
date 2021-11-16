// EXEC:%compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex unsupport for-in expr in differentiable function

@differentiable
func foo(x:Float16,y:Float32,z:Float64) {
    var a: Float16 = 1.0
    for ( i in 0..2:1){
        a = a + x
    }
    return a
}

func main():Int64 {
    var a:Float16 = 1.0
    var b:Float32 = 1.0
    var c:Float64 = 1.0
    var res = foo(a,b,c)
    if ( res != 3.0 ){
        return 1
    }
    return 0
}
