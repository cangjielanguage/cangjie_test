// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f

@differentiable
func foo(x:Float16,y:Float32,z:Float64) { // EXPECTED: regex error.*multiple returns are not supported by AD yet
    if ( z == 1.0) {
        return 2.0
    }
    if ( z == 1.0) {
        x + x
        return 3.0
    }else{
        y / Float32(2.0)
        return 4.0
    }
    return 1.0
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
