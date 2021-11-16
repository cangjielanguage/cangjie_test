// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type numtype<T> = T

func main(): Int64 {
    var f1: numtype<Float64> = 3.1415926
    var i1: numtype<Int64> = 4
    let i2: numtype<Int32> = -8
    let i3: numtype<Int8> = 16
    let i4: numtype<UInt16> = 32
    if (f1 == 3.1415926 && i1 == 4 && i2 == -8 && i3 == 16 && i4 == 32) {
        return 0
    }
    return 1
}