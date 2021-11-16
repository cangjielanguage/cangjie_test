// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    if( Set<Int64>.ns != 3) {
        return 3
    }
    Set<Int64>.ms = 10
    if( Set<Int64>.ms != 4) {
        return 4
    }
    return 0
}

extend Set<E> where E <: Hashable, E <: Equatable<E> {
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