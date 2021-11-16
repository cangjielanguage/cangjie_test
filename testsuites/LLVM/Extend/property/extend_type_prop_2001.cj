// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main() : Int64 {
    if( Int8.ns != 3) {
        return 3
    }
    Int8.ms = 10
    if( Int8.ms != 4) {
        return 4
    }
    return 0
}

extend (Int8) {  // EXPECTED: regex illegal extend type
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
