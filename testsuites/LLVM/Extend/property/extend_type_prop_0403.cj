// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    if( foo(Int64.ns) != 4 ) {
        return 1
    }
    if( foo(Int64.ms) != 7 ) {
        return 2
    }
    return 0
}

func foo(x : Int32 , y!:Int32 = x+1) : Int32 {
    return x * 2 + y
}

extend Int64 {
    static prop let ms: Int32 {
        get() {
            return 2
        }
    }
    static prop let ns: Int32 {
        get() {
            return 1
        }
    }
}
