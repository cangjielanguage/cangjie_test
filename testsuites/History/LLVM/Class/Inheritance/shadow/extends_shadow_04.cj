// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


interface Base {
    let aaa : Int32 = 1
}

class Data <: Base {
    let aaa : Int32 = 2
}

func main(): Int64 {
    var obj = Data()
    var res : Int32 = obj.aaa
    if ( res != 2 ) {
        return 1
    }
    return 0
}