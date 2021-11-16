// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


interface I {
    let a : Int32 = 1
}

open class Data1 <: I {
    let b : Int32 = I.a + 1
}

class Data <: Data1 {
    var one : Int32
    init() {
        one = b + I.a
    }
}

func main(): Int64 {
    var obj = Data()
    var res : Int32 = obj.one
    if ( res != 3 ) {
        return 1
    }
    return 0
}