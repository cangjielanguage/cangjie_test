// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    if( foo() != 3) {
        return 1
    }
    return 0
}

func foo( x!:Int32 = Int64.ns , y!:Int32 = Int64.ms ) : Int32 {
    return x + y
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
