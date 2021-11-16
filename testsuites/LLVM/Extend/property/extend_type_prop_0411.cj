// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    if (foo<Int64>(Int64.ms).n!= 1){
        return 1
    }
    return 0
}

func foo<T>(x:T):T {
    return x
}

extend Int64 {
    static prop let ms: Int64 {
        get() {
            return 2
        }
    }
    static prop let ns: Int64 {
        get() {
            return 1
        }
    }
    prop let n: Int64 {
        get() {
            return ns
        }
    }
}
