// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Object {}

class Date <: Object {
    var c: Int32
    init() {
        c = 1
    }
}

func main(): Int64 {

    var obj = Date()
    if (obj.c != 1) {
        return 1
    }

    return 0

}