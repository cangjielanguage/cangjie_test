// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    if( Range<Int64>.ns != 3) {
        return 3
    }
    if( Range<Int64>.ms != 4) {
        return 4
    }
    return 0
}

extend Range<T> where T <: AddInt64<T>, T <: Comparable<T>, T <: Equatable<T> {
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
