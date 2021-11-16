// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    if (foo<Int64>(1).n + foo<Int64>(1).m != 3){
        return 1
    }
    return 0
}

func foo<T>(x:T):T {
    return x
}

extend Int64 {
    prop let m: Int32 {
        get() {
            return 2
        }
    }
    prop let n: Int32 {
        get() {
            return 1
        }
    }
}
