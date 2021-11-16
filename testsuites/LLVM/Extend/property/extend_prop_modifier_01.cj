// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a:Int64 = 1
    if( a.n != 1) {
        return 1
    }
    if( a.foo() != 2) {
        return 2
    }
    return 0
}

extend Int64 {
    private prop let m: Int32 {
        get() {
            return 2
        }
    }
    prop let n: Int32 {
        get() {
            return 1
        }
    }
    func foo(){return m}
}
