// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    if( Float64.ns != 3) {
        return 3
    }
    if( Float64.ms != 4) {
        return 4
    }
    return 0
}

extend Float64 {
    static prop let ms: Int64 {
        get() {
            return 4
        }
    }
    static prop let ns: Int64 {
        get() {
            return 3
        }
    }
}
