// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type int = Int32

var i1: int = 3

func main(): Int64 {
    var i2: Int32 = 1
    let i3: int = 2
    var res: int = i1 + i2 +i3
    if (res == 6) {
        return 0
    }
    return 1
}