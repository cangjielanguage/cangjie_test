// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type int1 = Int64
type int2 = Int32

func main(): Int64 {
    var i1: Int64 = 1
    var i2: int1 = 2
    var i3: Int32 = 1
    var i4: int2 = 2
    i1--
    i1++
    var res1: int1 = i1 + i2
    i3--
    i3++
    var res2: int2 = i3 + i4
    if (res1 == 3 && res2 == 3) {
        return 0
    }
    return 1
}