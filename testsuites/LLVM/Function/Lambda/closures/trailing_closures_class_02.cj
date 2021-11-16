// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    var a1 = B("a")
    var a2 = B('a')
    if ( a1.m != 3 ){
        return 1
    }
    if ( a2.m != 3 ){
        return 1
    }
    return 0
}

open class B {
    var m:Int64 = 1
    init(a: Int64, fn: (Int64)->Int64) {
        m = fn(a)
    }
    init(x:String){
        this(1,{x:Int64 => x+ 1})
        m = m + 1
    }
    init(x:Char){
        this(1){x:Int64 => x+ 1}
        m = m + 1
    }
}

