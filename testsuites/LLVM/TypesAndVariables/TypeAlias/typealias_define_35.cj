// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type float<T> = Float64
type int1<T> = Int64
type int2<T> = Int32
type int3<T> = Int8
type uint1<T> = UInt16

func main(): Int64 {
    var f1: float<Int8> = 3.1415926
    var i1: int1<Int32> = 4
    let i2: int2<Int64> = -8
    let i3: int3<UInt8> = 16
    let i4: uint1<Float32> = 32
    if (f1 == 3.1415926 && i1 == 4 && i2 == -8 && i3 == 16 && i4 == 32) {
        return 0
    }
    return 1
}