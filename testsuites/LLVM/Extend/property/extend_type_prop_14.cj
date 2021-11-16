// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a:Char = 'p'
    if( a.n != 1) {
        return 1
    }
    if( a.m != 2) {
        return 2
    }

    if('p'.n != 1) {
        return 1
    }
    if( 'p'.m != 2) {
        return 2
    }
    return 0
}

extend Char {
    prop let m: Int64 {
        get() {
            return 2
        }
    }
    prop let n: Int64 {
        get() {
            return 1
        }
    }
}
