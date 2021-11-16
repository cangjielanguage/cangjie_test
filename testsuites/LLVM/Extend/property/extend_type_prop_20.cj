// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main() : Int64 {
    var a:Int8 = 1
    if( a.n != 1) {
        return 1
    }
    a.m = 10
    if( a.m != 2) {
        return 2
    }
    return 0
}

extend (Int8) { // EXPECTED: regex illegal extend type
    prop var m: Int64 {
        get() {
            return 2
        }
        set(v){}
    }
    prop let n: Int64 {
        get() {
            return 1
        }
    }
}
