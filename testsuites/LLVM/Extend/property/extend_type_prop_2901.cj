// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    if( Array<Int32>.ns != 3) {
        return 3
    }
    return 0
}

extend Array<T> {
    static prop let ns: Int64 {
        get() {
            return 3
        }
    }
}
