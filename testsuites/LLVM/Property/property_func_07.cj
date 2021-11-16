// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Coo {
    prop var a: Int64 {
        get() {
            return b * 2
        }
        set(v){ b = v + 1 }
    }
    var b :Int64 = 1
    init(){
        b = a
    }
}
func main():Int64 {
    if ( Coo().b  != 2 ){
        return 1
    }
    return 0
}
