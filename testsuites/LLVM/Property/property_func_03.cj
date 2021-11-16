// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Coo {
    static prop var a: Int64 {
        get() {
            return 0
        }
        set(v){}
    }
    var b:Int64 = a
    static var c:Int64 = a
}
func main():Int64 {
    if ( Coo().b != 0 || Coo.c != 0) {
        return 1
    }
    return 0
}
