// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a:Int64 = 1
    if( foo(a.n) != 4) {
        return 1
    }
    if( foo(a.m) != 7) {
        return 2
    }
    return 0
}

func foo(x:Int32 , y!:Int32 = x+1) : Int32 {
    return x*2 + y
}

extend Int64 {
    prop let m: Int32 {
        get() {
            return 2
        }
    }
    prop let n: Int32 {
        get() {
            return 1
        }
    }
}
