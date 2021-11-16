// EXEC: %compiler %stdx_cmp_opt  %f  -o %output 2>&1 | compare %f

from std import collection.*
//DTS202106230Q9Z3GP1200

func main(): Int64 {
    return 0
}

class Coo<K,V> <: HashMap<K,V> where K <: Hashable, K <: Equatable {  // EXPECTED: regex error.*?super class 'HashMap' is not inheritable, use 'open' modifier instead
    func hashCode() : UInt64 {
        return 0
    }
    operator func ==(right : Coo<K,V>) : Bool {
        return true
    }
}

