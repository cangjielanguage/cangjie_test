// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    if( foo() != 3) {
        return 1
    }
    return 0
}

var a:Int64 = 1

func foo() : Int32 {
    return a.n + a.m
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
