// EXEC:%compiler %enableAD %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

@differentiable
func foo(x:Float16,y:Float32,z:Float64) {
    Coo(y)
    1.0
}

@differentiable
record Coo{
    var a:Float64 = 1.0
    var b:Float32 = 1.0
    @differentiable
    Coo(x:Float32){
        b = x
    }
    @differentiable
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
