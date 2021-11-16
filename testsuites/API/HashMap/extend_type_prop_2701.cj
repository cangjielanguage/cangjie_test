// EXEC: %compiler %stdx_cmp_opt %f  -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func main() : Int64 {
    if( HashMap<Int64,Int64>.ns != 3) {
        return 3
    }
    HashMap<Int64,Int64>.ms = 10
    if( HashMap<Int64,Int64>.ms != 4) {
        return 4
    }
    return 0
}

extend HashMap<K , V> where K <: Hashable, K <: Equatable<K> {
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