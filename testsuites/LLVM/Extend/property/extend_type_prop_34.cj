// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a : Data = Data()
    if( a.n != 1) {
        return 1
    }
    a.m = 10
    if( a.m != 2) {
        return 2
    }
    return 0
}

record Data {}

extend Data {
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