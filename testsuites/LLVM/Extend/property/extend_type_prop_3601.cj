// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    if( Data.ns != 3) {
        return 3
    }
    Data.ms = 10
    if( Data.ms != 4) {
        return 4
    }
    return 0
}

class Data {}

extend Data {
    static prop var ms: Int64 {
        get() {
            return 4
        }
        set(v){}
    }
    static prop let ns: Int64 {
        get() {
            return 3
        }
    }
}