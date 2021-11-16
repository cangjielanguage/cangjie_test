// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type int1 = Int64
type int2 = Int32

func main(): Int64 {
    var i1: int1 = -1
    i1--
    i1--
    i1++
    i1++
    if (i1 == -1) {
        return 0
    }
    return 1
}