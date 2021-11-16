// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f

@differentiable
func foo(x:Float16,y:Float32,z:Float64) {
    var a: Float16 = 1.0
    while ( 1.0 < 3.0 ) {
        a = a + 1.0
        break // EXPECTED: regex error.*unsupport jump expr in differentiable function
    }
    return a
}

func main():Int64 {
    var a:Float16 = 1.0
    var b:Float32 = 1.0
    var c:Float64 = 1.0
    var res = foo(a,b,c)
    if ( res != 2.0 ){
        return 1
    }
    return 0
}
