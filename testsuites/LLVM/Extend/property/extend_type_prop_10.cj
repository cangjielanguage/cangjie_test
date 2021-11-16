// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a:UIntNative = 1
    if( a.n != 1) {
        return 1
    }
    return 0
}

extend UIntNative {
    prop let n: Int64 {
        get() {
            return 1
        }
    }
}