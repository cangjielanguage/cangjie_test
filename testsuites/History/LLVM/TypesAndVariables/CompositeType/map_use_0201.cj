x// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

//DTS202106230Q9Z3GP1200

func main(): Int64 {
    return 0
}

class Coo<K,V> <: Map<K,V> where K <: Hashable, K <: Equatable {
    func hashCode() : UInt64 {
        return 0
    }
    operator func ==(right : Coo<K,V>) : Bool {
        return true
    }
}

