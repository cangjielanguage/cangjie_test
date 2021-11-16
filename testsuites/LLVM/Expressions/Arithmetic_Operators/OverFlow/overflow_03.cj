// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    var base_a: Int8 =125
}

class Data <: Base {
    var a:Int8 = 1
    init(){
        a = super.base_a + 2
    }
}
func main(): Int64 {
    var a = Data().a
    if (a == 127) {
        return 0
    }
    return 1
}
