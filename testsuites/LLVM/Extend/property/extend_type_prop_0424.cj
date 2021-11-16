// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    if (foo<Int64>() != 7){
        return 1
    }
    return 0
}

func foo<T>():Int64 where T <: Int64 {
    return Int64.ns + Int64.ms
}

extend Int64 {
    static prop let ms: Int64 {
        get() {
            return 4
        }
    }
    static prop let ns: Int64 {
        get() {
            return 3
        }
    }
}
