// EXEC-PIPE-1: %compiler %cmp_opt %enableAD %n.cj -o %n.out 2>&1 | compare %f

@differentiable
func foo(x:Float64, y:Float64){ // EXPECTED: regex multiple returns are not supported by AD yet
    var temp = y
    do {
        temp = temp + x
        return x + temp 
    } while( x < 100.0)

    return x + temp 
}

func main(){
    return 0
}