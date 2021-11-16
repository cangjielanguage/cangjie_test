// EXEC-PIPE-1: %compiler %cmp_opt %f  -o %output 2>&1| compare %f

func main() : Int64 {
    var a:IntNative = 1
    a.m = 10
    return 0
}

extend IntNative {
    prop var m: Int64 { // EXPECTED: regex error.*there can not be property which has setter in immutable type
        get() {
            return 2
        }
        set(v){}
    }
}