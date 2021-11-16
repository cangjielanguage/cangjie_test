// EXEC-PIPE-1: %compiler %cmp_opt -c %f 2>&1 | compare %f

open class Base {}

class Data <: Base {
    var one : Int32 = 1
}

func main(): Int64 {
    var res : Int32 = Data.one  // EXPECTED: regex 'one' is non-static member, cannot access by type name
    if (res != 1) {
        return 1
    }
    return 0
}
