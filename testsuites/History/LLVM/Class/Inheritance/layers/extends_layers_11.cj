// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


interface I1 {
    let a : Int32 = 1
}

interface I2 <: I1 {
    let b : Int32 = I1.a + 1
}

interface I3 <: I2 {
    let c : Int32 = I2.b + 1
}

func main(): Int64 {
    var res : Int32 = I3.c
    if ( res != 3 ) {
        return 1
    }
    return 0
}