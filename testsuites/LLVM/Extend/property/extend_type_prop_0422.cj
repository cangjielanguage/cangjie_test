// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    if( foo().n != 1) {
        return 1
    }
    if( foo().m != 2) {
        return 1
    }
    return 0
}

func foo() : Int64 {
    var a:Int64 = 1
    return a
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
