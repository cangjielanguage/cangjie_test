// EXEC-PIPE-1: %compiler %cmp_opt %f  -o %output 2>&1| compare %f

func main() : Int64 {
    IntNative.ms = 10
    return 0
}

extend IntNative {
    static prop var ms: Int64 { // EXPECTED: regex error.*there can not be property which has setter in immutable type
        get() {
            return 4
        }
        set(v){}
    }
}