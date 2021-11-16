// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

internal type int = Int64

func main(): Int64 {
    var i1: Int64 = 1
    let i2: int = 2
    var res: int = i1 + i2
    if (res == 3) {
        return 0
    }
    return 1
}