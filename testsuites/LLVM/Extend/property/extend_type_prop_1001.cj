// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    if( UIntNative.ns != 3) {
        return 3
    }
    return 0
}

extend UIntNative {
    static prop let ns: Int64 {
        get() {
            return 3
        }
    }
}