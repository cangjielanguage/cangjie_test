// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


interface I3 {
    let a : Int32 = 1
}

interface I2 <: I3{
    let b : Int32 = I3.a + 1
}

class Data <: I2 {
    var one : Int32 = I3.a + I2.b
}

func main(): Int64 {
    var obj = Data()
    var res : Int32 = obj.one
    if ( res != 3 ) {
        return 1
    }
    return 0
}