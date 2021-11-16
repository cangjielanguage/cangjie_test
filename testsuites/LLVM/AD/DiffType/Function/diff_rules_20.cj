// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f

@differentiable
func foo(x:Float16,y:Float32,z:Float64) {
    var a: Float16 = x
    a++ // EXPECTED: regex error.*unsupport increment/decrement expr in differentiable function
}

func main():Int64 {
    var a:Float16 = 1.0
    var b:Float32 = 1.0
    var c:Float64 = 1.0
    var res = foo(a,b,c)
    if ( res != () ){
        return 1
    }
    return 0
}
