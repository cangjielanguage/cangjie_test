// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    if( Map<Int64,Int64>.ns != 3) {
        return 3
    }
    Map<Int64,Int64>.ms = 10
    if( Map<Int64,Int64>.ms != 4) {
        return 4
    }
    return 0
}

extend Map<K , V> where K <: Hashable, K <: Equatable<K> {
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