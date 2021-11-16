// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a1 = B(1, { i => i * 2 })
    if ( a1.m != 2 ) {
        return 1
    }
    var a2 = B(1) { i => i * 2 }
    if ( a2.m != 2 ) {
        return 1
    }
    var a3 = B({ i => i * 2 })
    if ( a3.m != 2 ) {
        return 1
    }
    var a4 = B(){}
    if ( a4.m != 1 ) {
        return 1
    }
    return 0
}

class B {
    var m:Int64 = 1
    init(a: Int64, fn: (Int64)->Int64) { m = fn(a) }
    init(fn: (Int64)->Int64) { m = fn(1) }
    init(fn: ()->Unit) { m =  1 }
    //init()(fn: ()->Unit) { m =  2 }

}
