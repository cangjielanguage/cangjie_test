// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a : IntNative = 1
    if( a.n != 1) {
        return 2
    }
    return 0
}

extend IntNative {
    prop let n: Int64 {
        get() {
            return 1
        }
    }
}
