// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a:Int64 = 1
    var b = Int64.ns
    var c = ()
    var d = Int64.ms
    if ( b!= 1 || c != () || d != 2 ){
        return 1
    }
    return 0
}

extend Int64 {
    static prop let ms: Int32 {
        get() {
            return 2
        }
    }
    static prop let ns: Int32 {
        get() {
            return 1
        }
    }
}
