// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    var a:Int64 = 1
    if( a.n != 1) {
        return 1
    }
    a.m = 10  // EXPECTED: regex error.*?can not access field 'm'
    if( a.m != 2) { // EXPECTED: regex error.*?can not access field 'm'
        return 2
    }
    return 0
}

extend Int64 {
    private prop var m: Int32 {
        get() {
            return 2
        }
        set(v){}
    }
    prop let n: Int32 {
        get() {
            return 1
        }
    }
}