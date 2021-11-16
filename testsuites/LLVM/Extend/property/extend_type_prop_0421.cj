// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a:Int64 = 1
    if( foo(a) != 3) {
        return 1
    }
    return 0
}

func foo(x:Int64) : Int32 {
    return x.n + x.m
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
