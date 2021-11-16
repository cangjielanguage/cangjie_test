// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    if( String.n != 1) {
        return 1
    }
    if( String.m != 2) {
        return 2
    }
    return 0
}

extend String {
    static prop let m: Int32 {
        get() {
            return 2
        }
    }
    static prop let n: Int32 {
        get() {
            return 1
        }
    }
    func foo(){return m}
}
