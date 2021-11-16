// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

internal interface I1 {
    let a: Int32 = 1
}

external interface I2 <: I1 {
    let a: Int32 = 2
}



func main(): Int64 {

    if I2.a != 2 || I1.a != 1 {
        return 1
    }

    return 0
}